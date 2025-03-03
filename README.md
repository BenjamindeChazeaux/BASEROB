# BASEROB - Plateforme d'analyse IA et de crawling web

BASEROB est une application Rails qui offre des outils d'analyse IA, de crawling web et de scoring géographique pour les sites web.

## Fonctionnalités principales

- **AI Analytics** : Analyse des visites humaines vs bots IA
- **Web Crawler** : Extraction de données structurées pour les LLMs
- **GEO Scoring** : Analyse géographique des visiteurs
- **Dashboard** : Visualisation des données et métriques clés
- **Robots Generator** : Création de fichiers robots.txt optimisés
- **LLM Ready Data** : Préparation de données pour les modèles de langage

## Démarrage rapide

1. Cloner le dépôt
2. Installer les dépendances : `bundle install`
3. Configurer la base de données : `rails db:setup`
4. Lancer le serveur : `rails server`
5. Accéder à l'application : `http://localhost:3000`

## Structure du projet

### Contrôleurs

- `app/controllers/application_controller.rb` : Contrôleur de base
- `app/controllers/home_controller.rb` : Pages d'accueil et tableau de bord
- `app/controllers/ai_analytics_controller.rb` : Analyse des visites IA
- `app/controllers/website_crawling_controller.rb` : Crawling de sites web
- `app/controllers/geo_scoring_controller.rb` : Scoring géographique
- `app/controllers/support_resources_controller.rb` : Ressources et support

### Modèles

- `app/models/user.rb` : Gestion des utilisateurs
- `app/models/visit.rb` : Suivi des visites (humaines et IA)
- `app/models/consultation.rb` : Demandes de consultation

### Vues

- `app/views/shared/_sidebar.html.erb` : Barre latérale commune
- `app/views/home/welcome.html.erb` : Tableau de bord principal
- `app/views/ai_analytics/index.html.erb` : Analyse des visites IA
- `app/views/website_crawling/index.html.erb` : Interface de crawling
- `app/views/robots_generator/index.html.erb` : Générateur de robots.txt

### JavaScript

L'application utilise Stimulus.js pour les interactions côté client :

- `app/javascript/controllers/dashboard_controller.js` : Animations du tableau de bord
- `app/javascript/controllers/sidebar_controller.js` : Gestion des sous-menus
- `app/javascript/controllers/charts_controller.js` : Initialisation des graphiques

### Styles

Les styles sont organisés en composants SCSS :

- `app/assets/stylesheets/components/_sidebar.scss` : Styles de la barre latérale
- `app/assets/stylesheets/components/_cards.scss` : Styles des cartes
- `app/assets/stylesheets/components/_charts.scss` : Styles des graphiques
- `app/assets/stylesheets/pages/_ai_analytics.scss` : Styles spécifiques à l'analyse IA

## Contribution

1. Forker le projet
2. Créer une branche pour votre fonctionnalité : `git checkout -b feature/nouvelle-fonctionnalite`
3. Commiter vos changements : `git commit -m 'Ajout d'une nouvelle fonctionnalité'`
4. Pousser vers la branche : `git push origin feature/nouvelle-fonctionnalite`
5. Ouvrir une Pull Request

## Licence

Copyright © 2024 BASEROB
