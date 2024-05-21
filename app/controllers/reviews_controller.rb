class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy, :edit]


  def index
    @reviews = review.where(params[:property_id || :manager_id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: "Review has been destroyed successfully"
  end

  def new
    @review = Review.new
    @manager = Manager.find(params[:manager_id])
  end

  def create
    @review = Review.new(review_params)

    @manager = Manager.find(params[:manager_id])
    @review.manager = @manager
    @review.user = current_user



    if @review.save
      check_property_id
    else
      render :new
    end


  end



  private

  def check_property_id
    if @review.property_id.nil?
      redirect_to manager_path(@manager), notice: "Review was created successfully"
    else
      redirect_to property_path(@review.property_id), notice: "Review was created successfully"
    end
  end

  def review_params
    params.require(:review).permit(:title, :rating, :pros, :cons, :advice, :location, :rent, :service_charge, :property_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
