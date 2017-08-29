class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.decimal :amount, precision: 15, scale: 2
      t.datetime :expiration
      t.references :recruitment, foreign_key: true

      t.timestamps
    end
  end
end
