Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"

  resource :user do
    member do
      get :download_file
      post :upload_file
      delete :delete_file
    end
  end
end
