Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Page d'accueil
  root "welcome#index"
  
  # Routes pour les pages Home
  get 'home/index'
  get 'home/welcome', to: 'home#welcome'
  get 'home/show'
  get 'home/logout', as: 'logout'

  # Routes pour les pages Welcome
  get 'welcome/index'
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/ai_analytics', to: 'welcome#ai_analytics'
  get 'welcome/geo_scoring', to: 'welcome#geo_scoring'
  get 'welcome/website_crawling', to: 'welcome#website_crawling'
  get 'welcome/settings', to: 'welcome#settings'
  
  # Routes du tableau de bord
  get 'dashboard', to: 'dashboard#index'
  get 'home', to: 'dashboard#home'
  
  # Modules principaux
  resources :ai_analytics, only: [:index]
  resources :geo_scoring, only: [:index]
  
  # Web Crawler avec fonctionnalités avancées
  resources :website_crawling, only: [:index] do
    collection do
      post :new_crawl
    end
  end
  
  # Paramètres et configuration
  resources :settings, only: [:index, :update]
  
  # Fonctionnalités supplémentaires
  get 'quick_start', to: 'setup#index'
  get 'baserob_101', to: 'training#index'
  
  # Consultations et support
  resources :consultations, only: [:new, :create]
  
  # Blog et contenu
  resources :blog, only: [:index, :show]
  
  # Chatbot
  get 'chat', to: 'chat#index'
  post 'chat/message', to: 'chat#message'
  
  # Suivi des visites
  resources :visits
end
