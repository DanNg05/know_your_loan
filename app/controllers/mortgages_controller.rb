class MortgagesController < ApplicationController
  before_action :mortgage_list, only: [:show, :edit, :update]
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
    # @mortgage = Mortgage.find(params[:id])
    @rate = @mortgage.rate
  end

  def new
    @rate = Rate.find(params[:rate_id])
    @mortgage = Mortgage.new
  end

  def edit
  end

  def update
    @mortgage.update(mortgage_params)
    @mortgage.user = current_user
    if @mortgage.save
      redirect_to dashboard_path
    end
  end
  private

  def mortgage_params
    params.require(:mortgage).permit(:property_value, :total_equity, :interest_rate, :rental_income, :maintenance_fund, :other_expenses)
  end

  def mortgage_list
    @mortgage = Mortgage.find(params[:id])
  end
end
