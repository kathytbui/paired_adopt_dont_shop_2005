class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorite
  has_many :applicant_pets
  has_many :applicants, through: :applicant_pets
end
