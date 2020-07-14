class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  def has_pending_pets(shelter_id)
    shelter = Shelter.find(shelter_id)
    shelter.pets.exists?(adoption_status: "Pending")
  end
end
