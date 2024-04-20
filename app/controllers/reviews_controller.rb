class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @broker = Broker.find(params[:broker_id])
  end

  def create
    # raise
    @review = Review.new(review_params)
    @broker = Broker.find(params[:broker_id])
    @review.user = current_user
    @review.broker = @broker
    if @review.save
      redirect_to broker_path(@broker)
    else
      # raise
      # redirect_to broker_path(@broker)
      render 'brokers/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
