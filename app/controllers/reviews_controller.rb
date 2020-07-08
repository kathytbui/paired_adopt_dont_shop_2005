class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
  @shelter_id = params[:id]
  end

  def create
    shelter = Shelter.find(params[:id])
    new_review = shelter.reviews.create(review_params)
    if new_review.save
      redirect_to("/shelters/#{shelter.id}")
    else
     flash[:notice] = "Error, you are missing information, Please fill out form completely"
     redirect_to("/shelters/#{shelter.id}/reviews/new")
   end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    if review.save
      redirect_to("/shelters/#{review.shelter_id}")
    else
     flash[:notice] = "Error, you are missing information, Please fill out form completely"
     redirect_to("/reviews/#{review.id}/edit")
    end
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :picture, :shelter_id)
  end
end
