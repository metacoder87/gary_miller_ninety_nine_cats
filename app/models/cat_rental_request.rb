class CatRentalRequest < ApplicationRecord

    STATUS_STATES = %w(Pending Denied Approved).freeze

    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: STATUS_STATES
    validate :start_must_come_before_end
    validate :does_not_overlap_approved_request

    belongs_to :cat

    after_initialize :assign_pending_status

    def approve!
        raise 'not pending' unless self.status == 'PENDING'
        
        transaction do
            self.status = 'APPROVED'
            self.save!

            overlapping_pending_requests.each do |request|
                request.update!(status:'DENIED')
            end
        end
    end

    def approved?
        self.status == 'APPROVED'
    end

    def denied?
        self.status == 'DENIED'
    end

    def deny!
        self.status = 'DENIED'
        self.save!
    end

    def pending?
        self.status == 'PENDING'
    end

private

    def assign_pending_status
        self.status ||= 'PENDING'
    end

    def overlapping_requests
        CatRentalRequest
            .where.not(id: self.id)
            .where(cat_id: cat_id)
            .where.not('start_date > :end_date OR end_date < :start_date',
                start_date: start_date, end_date: end_date)
    end

    def overlapping_approved_requests
        overlapping_requests.where('status = \'APPROVED\'')
    end

    def overlapping_pending_requests
        overlapping_requests.where('status = \'PENDING\'')
    end

    def does_not_overlap_approved_request
        # no need to check for denied requests
        return if self.denied
        unless overlapping_approved_requests.empty?
            errors[:base] <<
                'Request conflicts with an approved request.'
        end
    end

    def start_must_come_before_end
        return if start_date < end_date
        errors[:start_date] << "Start date must come before end date."
        errors[:end_date] << "End date must come after start date."
    end
end