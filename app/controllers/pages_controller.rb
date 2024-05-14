class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :broker_sign_up, :send_form]

  def home
    @lowest_rate = Rate.order(interest_value: :asc).first
  end


  def broker_sign_up
  end


  def send_form
    # raise
    AdminMailer.broker_send('admin@knowyourloan.site', "#{render "admin_mailer/email_format"}" , 'New Broker Sign Up').deliver_now
  end

  private

  def form_params
    params.require()
  end
end
