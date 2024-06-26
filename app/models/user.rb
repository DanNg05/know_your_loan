class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :homebuyer, dependent: :destroy
  has_one :mortgage, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :brokers, through: :appointments
end
