class HomeController < ApplicationController
  def index
    # Page d'accueil
  end

  def welcome
    # Pour la maquette, pas besoin de vérifier l'authentification
    # Simulez un utilisateur connecté
    @current_user = OpenStruct.new(name: "Demo User")
    
    # Données pour le graphique
    @visit_data = {
      labels: ['Human', 'AI Bot'],
      datasets: [{
        data: [65, 35],
        backgroundColor: ['#333333', '#86868b']
      }]
    }
  end

  def show
    # Redirection vers la page welcome si get_started est présent
    if params[:get_started]
      redirect_to home_welcome_path
    end
  end

end 