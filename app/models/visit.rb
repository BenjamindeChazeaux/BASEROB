# Modèle Visit
#
# Représente une visite sur le site web, qu'elle soit d'un humain ou d'un bot IA.
# Stocke les informations sur l'IP, l'agent utilisateur, le chemin visité et le type de visiteur.
class Visit < ApplicationRecord
  # Validations
  validates :path, presence: true
  
  # Scopes
  scope :human, -> { where(is_ai_bot: false) }
  scope :bot, -> { where(is_ai_bot: true) }
  scope :recent, -> { order(created_at: :desc).limit(100) }
  
  # Méthodes d'instance
  
  # Détermine si la visite provient d'un bot connu
  # @return [Boolean] true si c'est un bot connu, false sinon
  def from_known_bot?
    return false if user_agent.blank?
    
    known_bots = ['googlebot', 'bingbot', 'yandexbot', 'baiduspider']
    known_bots.any? { |bot| user_agent.downcase.include?(bot) }
  end
  
  # Retourne une représentation lisible du type de visiteur
  # @return [String] "Human" ou "AI Bot"
  def visitor_type
    is_ai_bot ? "AI Bot" : "Human"
  end
end
