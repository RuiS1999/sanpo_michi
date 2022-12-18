Rails.application.routes.draw do

  scope module: :user do
    root to:  'homes#top'
    get '/about' => 'homes#about', as: 'about'

    get   '/search/users' => 'searches#search_user'
    get   '/search/posts' => 'searches#search_post'
    get   '/search/post_hashtags' => 'searches#search_post_hashtag'

    get   '/users/retire'
    patch '/users/withdrawal'

    get   '/post/hashtag/:name' => 'posts#hashtag'
    get   '/post/hashtag' => 'posts#hashtag'

    get   '/step_log/graph' => 'step_logs#graph'

    resources  :users, param: :user_name, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
        get :followings, on: :member
        get :followers, on: :member
    end
    resources  :posts,        only: [:new, :show, :index, :edit, :create, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites,      only: [:create, :destroy]
      resource :reports,        only: [:new, :create, :destroy]
    end
    resources  :step_logs,     only: [:new, :index, :show, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get 'post/report_posts' => 'posts#report_post'

    root to:  'homes#top'
    resources  :users,  only: [:index, :show, :edit, :update]
    resources  :posts,  only: [:show, :index, :create, :destroy]
  end

  # ユーザー用
  # URL /sign_in ...
  devise_for :users, path: '',skip: [:passwords],  controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }

  devise_for :admins, skip: [:passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
