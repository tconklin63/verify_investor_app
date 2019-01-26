class AddUserIdToUploadedFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :uploaded_files, :user_id, :integer

    add_foreign_key :uploaded_files, :users, on_delete: :cascade
  end
end
