class Favorite < ApplicationRecord
  belongs_to :pet

  def self.pets
    Favorite.all.map do |favorite|
      favorite.pet
    end

  end
end
