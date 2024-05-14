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

    # if @review.property_id.nil?
    #   @review = Review.find(params[:review_id])
    #   @review.property = @manager.property
    # else
    #   @manager = Manager.find(params[:manager_id])
    #   @review.manager = @manager
    # end


    if @review.save
      redirect_to manager_path(:manager_id)
    end
    # if @review.save
    #   redirect_to @review, notice: "Review was created successfully"
    # else
    #   render :new
    # end

  end



  private

  def review_params
    params.require(:review).permit(:rating, :pros, :cons, :advice, :location)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
