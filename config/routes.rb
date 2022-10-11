Rails.application.routes.draw do
  scope module: :user do
    root to:  'homes#top'
    get '/about' => 'homes#about', as: 'about'

    get "search/users" => "searches#search_user"
    get "search/posts" => "searches#search_post"

    get     'users/retire'
    patch   'users/withdrawal'

    resources  :users, param: :user_name, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
        get :followings, on: :member
        get :followers, on: :member
    end
    resources  :posts,               only: [:new, :show, :index, :edit, :create, :update, :destroy] do
      resources :post_comments,       only: [:create, :destroy]
      resource :favorites,           only: [:create, :destroy]
    end
  end

  # ユーザー用
  # URL /sign_in ...
  devise_for :users, path: '',skip: [:passwords],  controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
