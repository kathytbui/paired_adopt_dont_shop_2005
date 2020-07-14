class Pet < ApplicationRecord

  belongs_to :shelter
  has_many :favorites, dependent: :delete_all
  has_many :applications_pets, dependent: :delete_all
  has_many :applications, through: :applications_pets
  validates_presence_of :image
  validates_presence_of :name
  validates_presence_of :approx_age
  validates_presence_of :sex
  validates_presence_of :description

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

  def self.pets_count
    Pet.all.count
  end
end
