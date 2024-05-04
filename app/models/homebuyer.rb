 class Homebuyer < ApplicationRecord
  validates :property_value, presence: true
  validates :total_deposit, presence: true
  validates :interest_rate, presence: true
  validates :salary, presence: true
  validates :other_income, presence: true
  validates :loan_term, presence: true
  validates :living_expenses, presence: true
  validates :car_loan_payment, presence: true
  validates :other_debts, presence: true

  belongs_to :user
  belongs_to :rate


  def calculate_homebuyer
    return unless property_value && total_deposit && interest_rate && loan_term

    loan_amount = property_value - total_deposit
    monthly_interest_rate = interest_rate / 100 / 12
    loan_term_in_years = loan_term

    self.loan_amount = loan_amount
    self.monthly_repayment = (loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate) ** (-loan_term_in_years * 12))

    principal_payments = []
    interest_payments = []
    remaining_balance = loan_amount
    total_interest_paid = 0

    loan_term_in_years.times do
      interest_payment_year = 0
      principal_payment_year = 0

      12.times do
        interest_payment_month = remaining_balance * monthly_interest_rate
        principal_payment_month = monthly_repayment - interest_payment_month
        principal_payment_month = [principal_payment_month, remaining_balance].min
        remaining_balance -= principal_payment_month

        interest_payment_year += interest_payment_month
        principal_payment_year += principal_payment_month
        principal_payment_year = principal_payment_year.round(0)
      end

      principal_payments << principal_payment_year
      interest_payments << interest_payment_year
      total_interest_paid += interest_payment_year
    end
    # principal_payments << 0
    # interest_payments << 0
    self.principal_payments = principal_payments
    self.interest_payments = interest_payments
    self.total_mortgage_repayment = monthly_repayment * loan_term_in_years * 12
    self.total_interest_paid = total_interest_paid
    self.net_disposable_income = salary + other_income - living_expenses - car_loan_payment - other_debts
    self.save!
    # self.interest_rate_safety = calculate_interest_rate_safety(loan_term_in_months / 12, net_disposable_income, loan_amount)
  end

  # private

  # def calculate_interest_rate_safety(loan_term, net_disposable_income, loan_amount)
  #   tolerance = 0.001
  #   interest_rate = @rate

  #   f = lambda do |interest_rate|
  #     monthly_interest_rate = interest_rate / 12
  #     monthly_repayment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_term * 12)))
  #     total_repayment = monthly_repayment * loan_term * 12
  #     total_repayment - net_disposable_income
  #   end

  #   rate = interest_rate
  #   f_rate = f.call(rate)
  #   step = 0.1

  #   while f_rate.abs > tolerance
  #     rate += f_rate < 0 ? step : -step
  #     f_rate = f.call(rate)
  #     step /= 2 if f_rate.abs < tolerance
  #   end

  #   rate
  # end

end
