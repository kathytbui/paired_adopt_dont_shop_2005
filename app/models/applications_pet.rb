class ApplicationsPet < ApplicationRecord
  belongs_to :applications
  belongs_to :pet
  has_many :approvals
end
