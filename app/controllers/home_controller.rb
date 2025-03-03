# HomeController
#
# Gère les pages principales de l'application, notamment la page d'accueil
# et le tableau de bord de bienvenue.
class HomeController < ApplicationController
  # Affiche la page d'accueil principale
  def index
    # Page d'accueil
  end

  # Affiche le tableau de bord de bienvenue avec les statistiques
  def welcome
    # Pour la maquette, pas besoin de vérifier l'authentification
    # Simulez un utilisateur connecté
    @current_user = OpenStruct.new(name: "Demo User")
    
    # Données pour le graphique de répartition des visites
    @visit_data = {
      labels: ['Human', 'AI Bot'],
      datasets: [{
        data: [65, 35],
        backgroundColor: ['#333333', '#86868b']
      }]
    }
  end

  # Affiche une page spécifique ou redirige vers welcome
  def show
    # Redirection vers la page welcome si get_started est présent
    if params[:get_started]
      redirect_to home_welcome_path
    end
  end
end 