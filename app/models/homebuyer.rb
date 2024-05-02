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
    loan_term_in_months = loan_term * 12

    self.loan_amount = loan_amount
    monthly_repayment = (loan_amount * monthly_interest_rate) / (1 - (1 + monthly_interest_rate) ** -loan_term_in_months)

    # principal_payments = []
    # interest_payments = []
    # remaining_balance = loan_amount
    # total_interest_paid = 0
    total_interest_paid = monthly_repayment * loan_term_in_months - loan_amount

    # loan_term_in_months.times do
    #   interest_payment = remaining_balance * monthly_interest_rate
    #   principal_payment = monthly_repayment - interest_payment
    #   remaining_balance -= principal_payment
    #   principal_payments << principal_payment
    #   interest_payments << interest_payment
    #   total_interest_paid += interest_payment
    # end

    # self.principal_payments_loan_term = principal_payments
    # self.interest_payments_loan_term = interest_payments
    self.total_mortgage_repayment = monthly_repayment * loan_term_in_months
    self.total_interest_paid = total_interest_paid

    net_disposable_income = salary + other_income - living_expenses - car_loan_payment - other_debts
    # self.interest_rate_safety = calculate_interest_rate_safety(loan_term_in_months / 12, net_disposable_income, loan_amount)
    self.net_disposable_income = net_disposable_income
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
