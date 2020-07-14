class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorites
  has_many :applications_pets
  has_many :applications, through: :applications_pets

  def update_status(petid)
    pet = Pet.find(petid)
    if pet[:adoption_status] == "Pending"
      update(adoption_status: "Adoptable")
    else pet[:adoption_status] == "Adoptable"
      update(adoption_status: "Pending")
    end
  end

  def applicant_name(pet_id)
    name = ApplicationsPet.where(pet_id: pet_id, status: "Pending")[0]
    if name.nil? == false
      name.applications.name
    end
  end
end
