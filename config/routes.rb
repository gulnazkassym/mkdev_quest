# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: { sessions: 'admin/sessions' }
  devise_for :users
  root 'events#index'
  resources :events
end
