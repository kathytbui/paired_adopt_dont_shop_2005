class AddStatusToApplicationsPets < ActiveRecord::Migration[5.1]
  def change
    add_column :applications_pets, :status, :string
  end
end
