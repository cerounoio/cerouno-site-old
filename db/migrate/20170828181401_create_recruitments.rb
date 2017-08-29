class CreateRecruitments < ActiveRecord::Migration[5.1]
  def change
    create_table :recruitments do |t|
      t.integer :referral
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
