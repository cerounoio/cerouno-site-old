class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.integer    :status, default: 0
      t.text       :steps, array: true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
