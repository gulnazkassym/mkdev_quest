# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    collection do
      get :user_list
    end
  end

  devise_for :users
  resources :users do
    member do
      get :confirm_email
    end
  end

  # admin
  devise_for :admins, path: 'admin', controllers: { sessions: 'admin/sessions' }
  devise_scope :admin do
    authenticated :admin do
      get 'admin', to: 'admin/events#index', as: :authenticated_root
      get 'admin/events/:id/edit', to: 'admin/events#edit',
                                   as: :admin_edit_event
    end

    unauthenticated do
      get 'admin', to: 'admin/sessions#new', as: :unauthenticated_root
      get 'admin/events/:id/edit', to: redirect('/admin')
    end
  end

  namespace :admin do
    resources :events
    root 'admin/events#index'
  end

  get 'tags/:tag', to: 'events#index', as: :tag
end
