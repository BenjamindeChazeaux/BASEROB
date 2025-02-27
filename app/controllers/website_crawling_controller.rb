# WebsiteCrawlingController
#
# Ce contrôleur gère les fonctionnalités de crawling de sites web.
# Il permet aux utilisateurs de soumettre des URLs pour analyse et
# de visualiser les données extraites dans un format adapté aux LLMs.
class WebsiteCrawlingController < ApplicationController
  # Affiche la page principale du crawler avec le formulaire de soumission
  # et les fonctionnalités principales
  def index
    # Données simulées pour la démo
    @crawl_stats = {
      pages_crawled: 1234,
      issues_found: 48,
      avg_load_time: "1.8s",
      bot_visits: 456
    }

    # Données pour le graphique
    @crawl_data = {
      labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
      datasets: [{
        label: 'Pages Crawled',
        data: [150, 230, 180, 340, 290, 270, 320],
        borderColor: '#333333',
        backgroundColor: 'rgba(51, 51, 51, 0.1)',
        tension: 0.4,
        fill: true
      }]
    }

    # Données pour le tableau des problèmes
    @recent_issues = [
      {
        url: '/products/category-1',
        issue_type: '404 Not Found',
        status: 'pending',
        last_checked: '2 hours ago'
      },
      {
        url: '/blog/post-2',
        issue_type: 'Slow Loading',
        status: 'active',
        last_checked: '5 hours ago'
      }
    ]
  end

  # Lance un nouveau crawl à partir de l'URL soumise
  # POST /website_crawling/new_crawl
  def new_crawl
    # Logique pour démarrer un nouveau crawl
    # TODO: Implémenter la logique réelle de crawling
    redirect_to website_crawling_index_path, notice: 'New crawl started'
  end
end 