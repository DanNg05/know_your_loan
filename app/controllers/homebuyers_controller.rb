class HomebuyersController < ApplicationController
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

  private

  def homebuyer_params
    params.require(:homebuyer).permit(:property_value, :total_equity, :interest_rate, :salary, :other_income, :loan_term, :living_expenses, :car_loan_payment, :other_debts, :net_disposable_income)
  end

end
