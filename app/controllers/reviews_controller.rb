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


    @review.save
    if @review.property_id.nil?
      redirect_to manager_path(@manager)
    else
      redirect_to property_path(@review.property_id)
    end
    # if @review.save
    #   redirect_to @review, notice: "Review was created successfully"
    # else
    #   render :new
    # end

  end



  private

  def review_params
    params.require(:review).permit(:rating, :pros, :cons, :advice, :location, :rent, :service_charge, :property_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
