class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @files = UploadedFile.where(user_id: current_user.id).order(filename: :asc)
  end

  def upload_file
    # File data is saved directly in the database via the binary data field
    if params[:file]
      UploadedFile.create(user_id: current_user.id,
                          filename: params[:file].original_filename,
                          data: params[:file].read,
                          extension: params[:file].original_filename.split('.').last)
    else
      flash[:warning] = "No file selected"
    end
    redirect_to current_user
  end

  def download_file
    file = UploadedFile.find(params[:file_id])
    send_data file.data, filename: file.filename, disposition: 'inline'
  end

  def delete_file
    UploadedFile.find(params[:file_id]).delete
    redirect_to current_user
  end
end
