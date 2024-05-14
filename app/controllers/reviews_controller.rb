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
    @reviews = Review.new
    @properties = Property.find(params[:property_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.manager = @manager
    @review.property = @property

    if @review.save
      redirect_to @review, notice: "Review was created successfully"
    else
      render :new
    end
  end




  private

  def review_params
    params.require(:review).permit(:rating, :pros, :cons, :advice)
  end

  def set_review
    @review = Review.find(params[:id])


end
