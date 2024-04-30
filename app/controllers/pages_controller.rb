class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @rates = Rate.all
    @lowest_rate = @rates.order(:interest_value).first
  end
end
