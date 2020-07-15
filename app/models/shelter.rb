class Shelter < ApplicationRecord
  before_destroy :destroy_pet_favorites, :destroy_pet_applications

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  def has_pending_pets
    self.pets.exists?(adoption_status: "Pending")
  end

  def applications_count
    apps = self.pets.flat_map do |pet|
      pet.applications
    end
    apps.count
  end

  private
  def destroy_pet_favorites
    self.pets.each do |pet|
      pet.favorites.destroy_all
    end
  end

  def destroy_pet_applications
    self.pets.each do |pet|
      pet.applications.destroy_all
    end
  end
end
