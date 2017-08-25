class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.integer :education          
      t.decimal :income, precision: 15, scale: 2
      t.boolean :technical_experience
      t.integer :objective
      t.string :resume_id
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
