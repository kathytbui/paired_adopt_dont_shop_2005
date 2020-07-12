class ApplicationsPet < ApplicationRecord
  belongs_to :applications
  belongs_to :pet
end
