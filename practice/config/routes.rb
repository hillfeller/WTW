Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/show'

  get 'comments/create'

  get 'comments/new'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

  # get 'posts/index'
  #
  # get 'posts/show'
  #
  # get 'posts/new'
  #
  # get 'posts/create'
  #
  # get 'posts/destroy'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  resources :posts do
    resources :comments
  end

end
