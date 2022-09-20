Rails.application.routes.draw do
  scope module: :user do
    root to:  'homes#top'
    get '/about' => 'homes#about', as: 'about'

    get     'users/retire'
    patch   'users/withdrawal'

    resources  :users, param: :user_name, only: [:index, :show, :edit, :update] do
      resources :favorites,           only: [:index, :create, :destroy]
    end
    resources  :follows,             only: [:index, :create, :destroy]
    resources  :favorites,           only: [:create, :destroy]
    resources  :posts,               only: [:new, :show, :index, :edit, :create, :update, :destroy] do
      resources :post_comments,       only: [:create, :destroy]
    end
    resources :category_relations,  only: [:create, :update, :destroy]
  end

  # ユーザー用
  # URL /sign_in ...
  devise_for :users, path: '', controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
