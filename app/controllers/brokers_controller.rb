class BrokersController < ApplicationController
  before_action  :broker_list, only: [:show, :create, :edit, :update]
  def index
    @brokers = Broker.all
    @markers = @brokers.geocoded.map do |broker|
      {
        lat: broker.latitude,
        lng: broker.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {broker: broker})
      }
    end
  end

  def show
    authorize @broker
    # raise
    @review = Review.new
    @appointments = Appointment.where(user_id: current_user.id, broker_id: params[:id])
    @appointment = Appointment.new
  end

  def new
    @broker = Broker.new
    authorize @broker
  end

  def create
    @broker = Broker.new(broker_params)
    authorize @broker
    if @broker.save
      redirect_to broker_path(@broker)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update
    @broker.update(broker_params)
    if @broker.save
      redirect_to broker_path(@broker)
    else
      render :new
    end
  end
  private

  def broker_params
    params.require(:broker).permit(:first_name, :last_name, :email, :about, :phone_number, :address)
  end

  def broker_list
    @broker = Broker.find(params[:id])
  end
end
