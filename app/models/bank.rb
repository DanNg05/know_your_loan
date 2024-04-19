class Bank < ApplicationRecord

  has_many :mortgages, dependent: :destroy
end
