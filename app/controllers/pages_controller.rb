class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
   @lowest_rate= Bank.order(:one_year).first
  end
end
