class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :rating, :content, :picture
end
