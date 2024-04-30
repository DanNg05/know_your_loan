class AppointmentsController < ApplicationController


  def index
    # raise
    @appointments = Appointment.where(user_id: current_user.id)
    @appointments_list = @appointments.order(:date)
    # @broker = Broker.find(params[:broker_id])
  end

  def new
    @appointment = Appointment.new
    @broker = Broker.find(params[:broker_id])
  end

  def create
    # raise
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @broker = Broker.find(params[:broker_id])
    @appointment.broker = @broker
    if @appointment.save
      redirect_to broker_path(@broker)
      # head :ok
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :message)
  end
end
