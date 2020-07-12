class CreateApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :approvals do |t|
      t.references :applications_pet, foreign_key: true
      t.timestamps
    end
  end
end
