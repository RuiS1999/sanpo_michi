Rails.application.routes.draw do
  scope module: :user do
    root to:  'homes#top'
    get '/about' => 'homes#about', as: 'about'

    get     'users/retire'
    patch   'users/withdrawal'

    resources  :users, param: :user_name, only: [:index, :show, :edit, :update] do
     resource :relationships, only: [:create, :destroy]
       get 'relationships/followers' => 'relationships#followers', as: 'followers'
       get 'relationships/followings' => 'relationships#followings', as: 'followings'
    end
    resources  :posts,               only: [:new, :show, :index, :edit, :create, :update, :destroy] do
      resources :post_comments,       only: [:create, :destroy]
      resources :favorites,           only: [:create, :destroy]
    end
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
