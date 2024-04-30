class Bank < ApplicationRecord
  has_many :rates, dependent: :destroy
  # has_many :mortgages, through: :rates, dependent: :destroy
end
