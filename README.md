# BASEROB - Plateforme d'analyse IA et de crawling web

BASEROB est une application Rails qui offre des outils d'analyse IA, de crawling web et de scoring géographique pour les sites web.

## Fonctionnalités principales

- **AI Analytics** : Analyse des visites humaines vs bots IA
- **Web Crawler** : Extraction de données structurées pour les LLMs
- **GEO Scoring** : Analyse géographique des visiteurs
- **Dashboard** : Visualisation des données et métriques clés

## Structure du projet

- `app/controllers/` : Contrôleurs de l'application
- `app/views/` : Vues organisées par contrôleur
- `app/models/` : Modèles de données
- `app/assets/stylesheets/` : Styles CSS
- `app/javascript/` : Code JavaScript et contrôleurs Stimulus

## Installation

1. Cloner le dépôt
2. Installer les dépendances : `bundle install`
3. Configurer la base de données : `rails db:setup`
4. Lancer le serveur : `rails s`

## Développement

### Contrôleurs principaux

- `WelcomeController` : Page d'accueil
- `HomeController` : Dashboard principal
- `WebsiteCrawlingController` : Fonctionnalités de crawling
- `AiAnalyticsController` : Analyse des visites IA

### Styles

Les styles sont organisés en plusieurs fichiers :
- `application.css` : Styles globaux
- `dashboard.css` : Styles du tableau de bord
- `home.css` : Styles de la page d'accueil

### JavaScript

L'application utilise Stimulus.js pour les interactions côté client :
- `dashboard_controller.js` : Gère les animations du tableau de bord
- `modal_controller.js` : Gère les fenêtres modales

## Licence

Copyright © 2024 BASEROB
