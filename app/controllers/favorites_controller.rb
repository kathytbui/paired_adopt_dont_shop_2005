class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    @viewable_favorites = @favorites.select {|favorite| favorite.pet.applications.empty? }
    @application_favorites = @favorites.select {|favorite| favorite.pet.applications.empty? == false }
  end

  def new
  end

  def create
    pet = Pet.find(params[:id])
    new_favorite = pet.favorites.create
    if new_favorite.save
      flash[:notice] = "I've been added to your favorites list!"
      redirect_to("/pets/#{pet.id}")
    end
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    pet.favorites.destroy_all
    redirect_back fallback_location: "/pets#{pet.id}"
    flash[:notice] = "You successfully removed this pet from your favorites"
  end

  def destroy_all
    Favorite.destroy_all
    redirect_to('/favorites')
  end

end
