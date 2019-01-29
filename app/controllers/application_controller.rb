class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    current_user
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
end
