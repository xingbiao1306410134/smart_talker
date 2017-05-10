Rails.application.routes.draw do
  get 'talker/index'

  get 'talker/text'

  get 'talker/t_a'

  get 'talker/a_t'



  get 'test/index'
  post 'talker/index_ajax'
  post 'talker/t_a_ajax'
  post 'talker/text_ajax'

  resources :users do
    collection do
      post :login
      get :new_user
    end
  end

  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
