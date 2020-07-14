class Shelter < ApplicationRecord

  before_destroy :destroy_pet_favorites

  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  def has_pending_pets(shelter_id)
    shelter = Shelter.find(shelter_id)
    shelter.pets.exists?(adoption_status: "Pending")
  end

  private
  def destroy_pet_favorites
    self.pets.each do |pet|
      pet.favorites.destroy_all
    end
  end

  def nullify_pet_id_on_applications_pets
    self.pets.each do |pet|
      pet.applications_pets.destroy_all
    end
  end
end
