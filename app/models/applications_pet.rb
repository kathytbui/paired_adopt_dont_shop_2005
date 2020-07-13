class ApplicationsPet < ApplicationRecord
  belongs_to :applications
  belongs_to :pet
  has_many :approvals

  def self.uniq_app(app_id, pet_id)
    binding.pry

  end
end
