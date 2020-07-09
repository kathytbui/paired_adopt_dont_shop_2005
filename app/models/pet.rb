class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :favorite
end
