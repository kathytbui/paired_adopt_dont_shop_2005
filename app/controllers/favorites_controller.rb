class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all 
  end
end
