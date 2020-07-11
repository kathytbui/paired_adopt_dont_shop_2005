class ApplicantsController < ApplicationController

  def new
    @favorites = Favorite.all
  end
end
