class MortgagesController < ApplicationController
  def new
    @mortgage = Mortgage.new
  end

  def create
    @mortgage = Mortgage.new(mortgage_params)
    if @mortgage.save
      # Handle successful save, e.g., redirect to a success page
      redirect_to @mortgage, notice: 'Mortgage was successfully calculated.'
    else
      # Handle validation errors, e.g., render the form again with errors
      render :new
    end
  end


  def input
  end

  def result

  end

  private

  def mortgage_params
    params.require(:mortgage).permit(:property_value, :total_equity, :interest_rate, :loan_amount)
  end

end
