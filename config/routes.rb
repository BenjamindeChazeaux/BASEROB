Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Page d'accueil
  root "home#index"
  
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
  
  # Routes pour les tableaux de bord
  get 'ai_dashboards', to: 'ai_dashboards#index', as: 'ai_dashboards'
  get 'ai_dashboards/dashboard1', to: 'ai_dashboards#dashboard1', as: 'dashboard1'
  get 'ai_dashboards/dashboard2', to: 'ai_dashboards#dashboard2', as: 'dashboard2'
  get 'ai_dashboards/dashboard3', to: 'ai_dashboards#dashboard3', as: 'dashboard3'
  
  # Modules principaux
  resources :ai_analytics, only: [:index]
  resources :geo_scoring, only: [:index]
  get 'geo_scoring', to: 'geo_scoring#index', as: 'geo_scoring'
  
  # Web Crawler et optimisation de site
  resources :website_crawling, only: [:index] do
    collection do
      post :new_crawl
    end
  end
  
  # Routes pour le sous-menu de Site Optimization
  get 'robots_generator', to: 'robots_generator#index', as: 'robots_generator'
  get 'llm_ready_data', to: 'llm_ready_data#index', as: 'llm_ready_data'
  get 'ai_optimization_agent', to: 'ai_optimization_agent#index', as: 'ai_optimization_agent'
  
  # Paramètres et configuration
  resources :settings, only: [:index, :update]
  
  # Fonctionnalités supplémentaires
  get 'quick_start', to: 'setup#index'
  get 'baserob_101', to: 'training#index'
  
  # Consultations et support
  resources :consultations, only: [:new, :create]
  get 'support_resources', to: 'support_resources#index', as: 'support_resources'
  
  # Blog et contenu
  resources :blog, only: [:index, :show]
  
  # Chatbot
  get 'chat', to: 'chat#index'
  post 'chat/message', to: 'chat#message'
  
  # Suivi des visites
  resources :visits
end
