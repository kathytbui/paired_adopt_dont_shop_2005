class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :favorites_count

  def favorites_count
    @favorites = Favorite.all
  end
end
