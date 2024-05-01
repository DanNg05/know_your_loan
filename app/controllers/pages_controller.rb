class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @lowest_rate = Rate.order(interest_value: :asc).first
  end
end
