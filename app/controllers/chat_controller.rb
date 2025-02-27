class ChatController < ApplicationController
  # Supprimer l'authentification
  # before_action :authenticate_user!
  
  # Interface du chat
  def index
  end
  
  # Traitement des messages
  def message
    # Logique de traitement des messages du chatbot
    render json: { response: "Placeholder response from chatbot" }
  end
end 