class AddProgramToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :program, :integer
  end
end
