class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorites
  has_many :applications_pets
  has_many :applications, through: :applications_pets
end
