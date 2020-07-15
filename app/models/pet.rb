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

  def update_status
    if self.adoption_status. == "Pending"
      update(adoption_status: "Adoptable")
    else self.adoption_status == "Adoptable"
      update(adoption_status: "Pending")
    end
  end

  def has_pending_applications
    self.applications_pets.exists?(status: "Pending")
  end

  def applicant_id
    self.applications_pets.where(status: "Pending")[0].applications_id
  end

  def applicant_name
    self.applications.find(applicant_id).name
  end

  def self.pets_count
    Pet.all.count
  end
end
