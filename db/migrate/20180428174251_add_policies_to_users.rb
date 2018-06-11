class AddPoliciesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :policies, :boolean
  end
end
