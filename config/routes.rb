# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    collection do
      get :user_list
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
    end
  end

  namespace :admin do
    resources :events
    root 'admin/events#index'
  end
end
