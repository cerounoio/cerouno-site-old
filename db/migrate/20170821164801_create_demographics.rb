class CreateDemographics < ActiveRecord::Migration[5.1]
  def change
    create_table :demographics do |t|
      t.date :birthdate
      t.integer :gender
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
