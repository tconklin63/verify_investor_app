# == Schema Information
#
# Table name: uploaded_files
#
#  id         :bigint(8)        not null, primary key
#  filename   :string
#  data       :binary
#  extension  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class UploadedFile < ApplicationRecord
  belongs_to :user
end
