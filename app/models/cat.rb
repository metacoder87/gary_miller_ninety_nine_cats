require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    CAT_COLORS = %w(black brown grey orange yellow white).freeze

    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :color, :name, :sex, presence: true

    belongs_to :owner,
        class_name 'User',
        foreign_key :user_id

    has_many :rental_requests,
        class_name: 'CatRentalRequest',
        dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end
end