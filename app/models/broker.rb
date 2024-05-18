class Broker < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :about, :first_name, :last_name, :description, :phone_number, :address, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_first_name_and_address,
    against: [ :first_name, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
