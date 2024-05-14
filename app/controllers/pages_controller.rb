class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :broker_sign_up, :send_form]

  def home
    @lowest_rate = Rate.order(interest_value: :asc).first
  end


  def broker_sign_up
  end


  def send_form
    AdminMailer.broker_send('knowyourloan123@gmail.com', 'test', 'subject').deliver_now
  end
end
