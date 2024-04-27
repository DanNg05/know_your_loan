class MortgagesController < ApplicationController
  def create
    # raise
    @rate = Rate.find(params[:rate_id])
    @mortgage = Mortgage.new(mortgage_params)
    @mortgage.rate = @rate
    @mortgage.user = current_user
      @mortgage.calculate_mortgage
      if @mortgage.save
        redirect_to mortgage_path(@mortgage), notice: 'File was successfully created.'
      else
        render :new
      end
  end

  def show
    @mortgage = Mortgage.find(params[:id])
    @rate = @mortgage.rate
  end

  def new
    @rate = Rate.find(params[:rate_id])
    @mortgage = Mortgage.new
  end

  private

  def mortgage_params
    params.require(:mortgage).permit(:property_value, :total_equity, :interest_rate, :rental_income, :maintainence_fund, :other_expenses)
  end
end
