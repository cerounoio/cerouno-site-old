class AddResumeFilenameToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :resume_filename, :string
  end
end
