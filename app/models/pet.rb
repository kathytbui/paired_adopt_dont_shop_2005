class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorites
  has_many :applications_pets
  has_many :applications, through: :applications_pets

  def update_status
    update(adoption_status: "Pending")
  end
end
