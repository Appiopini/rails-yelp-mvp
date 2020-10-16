class ReviewsController < ApplicationController

  def create
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
end

private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit.(:contet)
  end
end
