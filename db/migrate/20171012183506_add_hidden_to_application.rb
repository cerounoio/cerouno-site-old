class AddHiddenToApplication < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :hidden, :boolean, default: false
  end
end
