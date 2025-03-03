# Créez ce fichier s'il n'existe pas déjà
# Ce fichier permet de configurer les pins pour importmap

Rails.application.config.importmap.pins.delete("react")
Rails.application.config.importmap.pins.delete("react-dom") 