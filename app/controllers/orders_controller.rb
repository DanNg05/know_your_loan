class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    # raise
    # AdminMailer.broker_send('admin@knowyourloan.site', "Hello there" , 'New Broker Sign Up').admin_mailer.deliver_now
    if @order.save
      AdminMailer.admin_mailer(@order).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :description, :about, :address, :phone_number)
  end
end
