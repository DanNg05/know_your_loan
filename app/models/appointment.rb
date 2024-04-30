class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :broker

  validates :message, :date, presence: true
end
