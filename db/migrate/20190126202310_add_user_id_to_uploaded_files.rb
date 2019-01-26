class AddUserIdToUploadedFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :uploaded_files, :user_id, :integer

    
  end
end
