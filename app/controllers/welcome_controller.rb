class WelcomeController < ApplicationController
  # Page d'accueil initiale avec le bouton "Get Started"
  def index
    if params[:logo] == "baserob"
      redirect_to home_index_path
    end
  end

  def home
    redirect_to home_welcome_path
  end

  def ai_analytics
    redirect_to ai_analytics_index_path
  end

  def geo_scoring
    redirect_to geo_scoring_index_path
  end

  def website_crawling
    redirect_to website_crawling_index_path
  end

  def settings
    redirect_to settings_index_path
  end
end 