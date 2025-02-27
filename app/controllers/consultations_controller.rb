class ConsultationsController < ApplicationController
  # Supprimer l'authentification
  # before_action :authenticate_user!
  
  # Formulaire de prise de rendez-vous
  def new
    @consultation = Consultation.new
  end
  
  # Traitement de la demande de consultation
  def create
    @consultation = Consultation.new(consultation_params)
    # @consultation.user = current_user if current_user
    
    if @consultation.save
      redirect_to home_path, notice: "Consultation request submitted successfully"
    else
      render :new
    end
  end
  
  private
  
  def consultation_params
    params.require(:consultation).permit(:name, :email, :date, :message)
  end
end 