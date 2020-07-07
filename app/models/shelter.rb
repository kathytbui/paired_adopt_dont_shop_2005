class Shelter < ApplicationRecord
  has_many :pets, dependent: :delete_all
  has_many :reviews

  # def review
  #   Review
  # end
end
