class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.integer :education,            default: 0
      t.decimal :income,               default: 0, precision: 15, scale: 2
      t.boolean :technical_experience, defualt: false
      t.integer :objective,            default: 0
      t.string :resume_id
      t.references :application,       foreign_key: true

      t.timestamps
    end
  end
end
