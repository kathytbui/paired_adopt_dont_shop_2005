class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :content
  belongs_to :shelter

  def self.average_rating
    average(:rating)
  end
end
