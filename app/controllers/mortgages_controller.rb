class MortgagesController < ApplicationController
  def create
    # raise
    @bank = Bank.find(params[:bank_id])
    @mortgage = Mortgage.new(mortgage_params)
    @mortgage.bank = @bank
    @mortgage.user = current_user
    # if @mortgage.valid?
      @mortgage.calculate_mortgage
      if @mortgage.save
        redirect_to mortgage_path(@mortgage), notice: 'Mortgage was successfully created.'
      else
        render :new
      end
    # else
    #   render :new
    # end
  end

  def show
    @mortgage = Mortgage.find(params[:id])
  end

  def new
    @bank = Bank.find(params[:bank_id])
    @mortgage = Mortgage.new
  end

  private

  def mortgage_params
    params.require(:mortgage).permit(:property_value, :total_equity, :interest_rate, :rental_income, :maintainence_fund, :other_expenses)
  end
end
