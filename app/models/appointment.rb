class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :broker

  validates :message, presence: :true
end
