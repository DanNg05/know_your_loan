class Mortgage < ApplicationRecord
  validates :property_value, presence: true
  validates :total_equity, presence: true
  validates :interest_rate, presence: true
  validates :rental_income, presence: true
  validates :maintenance_fund, presence: true
  validates :other_expenses, presence: true

  belongs_to :user
  belongs_to :rate

  def calculate_mortgage
    loan_amount = property_value - total_equity
    interest_rate_decimal = interest_rate / 100
    monthly_interest_rate = interest_rate_decimal / 12
    loan_term_in_months = 30 * 12 # Assuming a 30-year loan term
    self.loan_amount = loan_amount
    self.monthly_repayment = (loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate) ** -loan_term_in_months)
    monthly_cashflow = rental_income - maintenance_fund - other_expenses - monthly_repayment
    self.monthly_cashflow = monthly_cashflow
  end
end
