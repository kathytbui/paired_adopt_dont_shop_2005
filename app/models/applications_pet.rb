class ApplicationsPet < ApplicationRecord
  after_initialize :set_default_status
  belongs_to :applications
  belongs_to :pet

  def self.get_applications_pet(application_id, pet_id)
    ApplicationsPet.where(applications_id: application_id, pet_id: pet_id)[0]
  end

  private

  def set_default_status
    self.status = "Submitted" if status.nil?
  end
end
