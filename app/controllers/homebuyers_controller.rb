class HomebuyersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:calculate_net_disposable_income]

  def calculate_net_disposable_income
    # Retrieve parameters from the request
    salary = params[:salary].to_f
    other_income = params[:otherIncome].to_f
    living_expenses = params[:livingExpenses].to_f
    car_loan_payment = params[:carLoanPayment].to_f
    other_debts = params[:otherDebts].to_f

    # Calculate net disposable income
    net_disposable_income = salary + other_income - living_expenses - car_loan_payment - other_debts

    render json: { net_disposable_income: net_disposable_income }
  end

  def index
    @banks = Bank.first(6)
  end

  def create
    # raise
    @rate = Rate.find(params[:rate_id])
    @homebuyer = Homebuyer.new(homebuyer_params)
    @homebuyer.rate = @rate
    @homebuyer.user = current_user
      @homebuyer.calculate_homebuyer
      # raise
      if @homebuyer.save!
        redirect_to homebuyer_path(@homebuyer), notice: 'File was successfully created.'
      else
         # alert box possible
        render :new
      end
  end

  def show
    @homebuyer = Homebuyer.find(params[:id])
    @rate = @homebuyer.rate
    # @principal_data = []
    # @loan_balance = @homebuyer.loan_amount
    # @homebuyer.principal_payments.each_with_index do |principle, index|
    #   if index == 0
    #     data_value = [index, @loan_balance]
    #   elsif index == @homebuyer.loan_term
    #     data_value = [index, 0]
    #   else
    #     @loan_balance = @loan_balance - principle
    #     data_value = [index, @loan_balance]
    #   end
    #   @principal_data << data_value
    # end
    @loan_balance = @homebuyer.loan_amount.round(0)
    @principal_data = [[0, @homebuyer.loan_amount.round(0)]]
    # raise
    for i in 1..@homebuyer.loan_term do
      if i == @homebuyer.loan_term
        data = [i, 0]
        @principal_data << data
      else
        @loan_balance -= @homebuyer.principal_payments[i-1]
        data = [i, @loan_balance.round(0)]
        @principal_data << data
      end
    end

    @debt = [[0, @homebuyer.total_mortgage_repayment.round(0)]]
    @remaining = @homebuyer.total_mortgage_repayment.round(0)
    for i in  1..@homebuyer.loan_term do
      # raise
      if i == @homebuyer.loan_term
        data = [i, 0]
        @principal_data << data
      else
        total_payment_for_current_year = @homebuyer.principal_payments[i-1] + @homebuyer.interest_payments[i-1]
        @remaining -= total_payment_for_current_year
        data = [i, @remaining.round(0)]
        @debt << data
      end
      # raise
    end

    # raise
  end

  def new
    @rate = Rate.find(params[:rate_id])
    @homebuyer = Homebuyer.new
  end

  def list
    @homebuyers = Homebuyer.where(user: current_user)
  end

  private

  def homebuyer_params
    params.require(:homebuyer).permit(:property_value, :total_deposit, :interest_rate, :salary, :other_income, :loan_term, :living_expenses, :car_loan_payment, :other_debts, :net_disposable_income)
  end

end
