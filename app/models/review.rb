class Review < ApplicationRecord
  belongs_to :user
  belongs_to :broker

  validates :content, :rating, presence: true
end
