class Event < ApplicationRecord
	belongs_to :user
	has_many :photos
	has_and_belongs_to_many :categories
	has_many :registrations, dependent: :destroy
	has_many :registered_users, through: :registrations, source: :user

	validates :name, presence: true
	validates :description, presence: true, length: { maximum: 500 }
	validates :starts_at, presence: true
	validates :ends_at, presence: true
	validate :start_is_valid, :end_is_valid

	def bargain?
		price < 30
	end

	def self.order_by_price
		order :price
	end

	private

	def start_is_valid
		if ((starts_at.present?) && (starts_at < Date.today))
			errors.add(:starts_at, "date must be later than now!")
		end
	end

	def end_is_valid
		if ((ends_at.present?) && (starts_at.present?) && (ends_at < (starts_at + 1.days)))
			errors.add(:ends_at, "date must be at least 1 day after start")
		end
	end
end
