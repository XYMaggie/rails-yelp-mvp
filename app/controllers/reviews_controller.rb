class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews/new
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    puts @review.inspect
    @review.restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      redirect_to  restaurant_path(params[:restaurant_id])
    else
      puts @review.errors.inspect
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, :rating, :restaurant_id)
    end
end
