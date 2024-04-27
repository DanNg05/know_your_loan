class Homebuyer < ApplicationRecord
  validates :property_value, presence: true
  validates :total_equity, presence: true
  validates :interest_rate, presence: true
  validates :salary, presence: true
  validates :other_income, presence: true
  validates :other_expenses, presence: true
  validates :loan_term, presence: true
  validates :living_expenses, presence: true
  validates :car_loan_payment, presence: true
  validates :other_debts, presence: true

  belongs_to :user
  belongs_to :rate

  def calculate_homebuyer
    loan_amount = property_value - total_equity
    interest_rate_decimal = interest_rate / 100
    monthly_interest_rate = interest_rate_decimal / 12
    loan_term_in_months = 30 * 12 # Assuming a 30-year loan term
    self.loan_amount = loan_amount
    self.monthly_repayment = (loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate) ** -loan_term_in_months)
    net_disposable_income = salary + other_income - living_expenses - car_loan_payment - other_debts
    self.net_disposable_income = net_disposable_income
  end
end
