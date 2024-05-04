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
      if @homebuyer.save
        redirect_to homebuyer_path(@homebuyer), notice: 'File was successfully created.'
      else
        render :new
      end
  end

  def show
    @homebuyer = Homebuyer.find(params[:id])
    @rate = @homebuyer.rate
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
