Rails.application.routes.draw do
  resources :rustles do
    collection do
      post :confirm
    end
  end
end