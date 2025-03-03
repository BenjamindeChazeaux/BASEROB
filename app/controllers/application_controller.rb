# ApplicationController
#
# Contrôleur de base dont héritent tous les autres contrôleurs.
# Définit les méthodes d'aide et les filtres communs à toute l'application.
class ApplicationController < ActionController::Base
  helper_method :current_user
  
  private
  
  # Récupère l'utilisateur actuellement connecté
  # @return [User, nil] L'utilisateur connecté ou nil si aucun utilisateur n'est connecté
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
  end
end
