class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @lowest_rate = @rates[:one_year].order.first
  end
  end
