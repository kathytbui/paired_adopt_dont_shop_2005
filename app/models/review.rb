class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :content
  validates_presence_of :picture
  belongs_to :shelter
end
