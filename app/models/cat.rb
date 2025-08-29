require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    CAT_COLORS = %w(black brown grey orange yellow white).freeze

    validates :color, inclusion: CAT_COLORS, unless: -> { color.blank? }
    validates :sex, inclusion: %w(M F), if: -> { sex }
    validates :birth_date, :color, :name, :sex, presence: true
    validate :birth_date_in_the_past, if: -> { birth_date }
    validates :image_url, allow_blank: true , format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }

    belongs_to :owner,
        class_name: 'User',
        foreign_key: :user_id

    has_many :rental_requests,
        class_name: 'CatRentalRequest',
        dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end

    before_validation :set_default_image_url, if: -> { image_url.blank? }

private

    def birth_date_in_the_past
        if birth_date && birth_date > Time.now
            errors[:birth_date] << 'must have been born in the past'
        end
    end

    def set_default_image_url
        self.image_url = CatImageService.fetch_random_cute_cat_image_url
    rescue StandardError => e
        Rails.logger.error "Failed to set image URL for cat #{name}: #{e.message}"
        self.image_url = 'https://cdn2.thecatapi.com/images/default_cat.jpg'  # Fallback
    end
end