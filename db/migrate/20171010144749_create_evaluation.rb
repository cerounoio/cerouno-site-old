class CreateEvaluation < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :initiative
      t.integer :collaboration
      t.integer :organization
      t.integer :diversity
      t.integer :resilience
      t.integer :logic
      t.references :application, foreign_key: true
      t.references :evaluator, references: :users
    end

    add_foreign_key :evaluations, :users, column: :evaluator_id
  end
end
