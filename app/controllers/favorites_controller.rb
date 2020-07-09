class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
  end

  def create
    pet = Pet.find(params[:id])
    new_favorite = pet.favorite.create
    if new_favorite.save
      flash[:notice] = "I've been added to your favorites list!"
      redirect_to("/pets/#{pet.id}")
    end 
  end
end
