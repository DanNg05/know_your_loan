class Broker < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :appointments, dependent: :destroy
end
