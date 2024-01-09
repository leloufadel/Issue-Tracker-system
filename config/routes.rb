# Rails.application.routes.draw do
#   devise_for :users

#   resources :issues do
#     resources :attachments, only: [:create, :destroy]
#   end

#   root 'issues#index'
# end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
    # Add other Devise controllers as needed
  }

  resources :issues do
    resources :attachments, only: [:create, :destroy]
  end

  root 'issues#index'
end
