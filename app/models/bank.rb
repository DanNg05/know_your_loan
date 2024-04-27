class Bank < ApplicationRecord
  has_many :mortgages, through: :rates, dependent: :destroy
end
