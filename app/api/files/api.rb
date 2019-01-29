module Files
  class Api < Grape::API
    version 'v1', using: :header, vendor: 'verify_investor'
    format :json
    prefix :api

    resource :user do
      desc 'List files for a user'
      params do
        requires :user_id, type: Integer, desc: 'User ID'
      end
      route_param :user_id do
        get :list_files do
          files = UploadedFile.where(user_id: params[:user_id])
                              .order(filename: :asc).pluck(:id, :filename)
          result = []
          files.each do |file|
            result = { id: file[0], filename: file[1] }
          end
          result.as_json
        end
      end

      desc 'Upload a file'
      params do
        requires :user_id, type: Integer, desc: 'User ID'
        requires :file, type: File, desc: 'File to upload'
      end
      route_param :user_id do
        post :upload_file do
          begin
            UploadedFile.create(user_id: params[:user_id],
                                filename: params[:file][:filename],
                                data: params[:file][:tempfile].read,
                                extension: params[:file][:filename].split('.').last)
            { message: "Uploaded #{params[:file][:filename]}" }.as_json
          rescue => e
            { error: e.message }.as_json
          end
        end
      end
    end
  end
end
