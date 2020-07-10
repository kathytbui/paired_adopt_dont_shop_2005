class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorite
  # def favorite_pets
  #   favorites = Favorite.all
  #   fav_pet_id = favorites.map do |favorite|
  #     favorite.pet_id
  #   end
  # end
end
