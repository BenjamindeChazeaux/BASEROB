/**
 * Contrôleur Stimulus pour les graphiques
 * 
 * Initialise et gère les graphiques Chart.js dans l'application.
 * Supporte différents types de graphiques : lignes, camemberts, etc.
 */
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timeseriesChart", "pieChart"]

  /**
   * Initialise les graphiques lors de la connexion à l'élément DOM
   */
  connect() {
    this.initializeCharts()
  }

  /**
   * Initialise tous les graphiques disponibles
   */
  initializeCharts() {
    this.initializeTimeseriesChart()
    this.initializePieChart()
  }

  /**
   * Initialise le graphique de séries temporelles
   */
  initializeTimeseriesChart() {
    const chartElement = this.timeseriesChartTarget
    const canvas = chartElement.querySelector('#trafficChart')
    if (!canvas) return
    
    const ctx = canvas.getContext('2d')
    
    // Données pour le graphique
    const data = {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
      datasets: [
        {
          label: 'Human Visitors',
          data: [65, 59, 80, 81, 56, 55, 40],
          borderColor: '#333333',
          backgroundColor: 'rgba(51, 51, 51, 0.1)',
          tension: 0.4,
          fill: true
        },
        {
          label: 'AI Bot Visitors',
          data: [28, 48, 40, 19, 86, 27, 90],
          borderColor: '#0A84FF',
          backgroundColor: 'rgba(10, 132, 255, 0.1)',
          tension: 0.4,
          fill: true
        }
      ]
    }
    
    // Options du graphique
    const options = {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          position: 'top',
          labels: {
            usePointStyle: true
          }
        }
      },
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
    
    // Création du graphique
    new Chart(ctx, {
      type: 'line',
      data: data,
      options: options
    })
  }

  /**
   * Initialise le graphique en camembert
   */
  initializePieChart() {
    const chartElement = this.pieChartTarget
    const canvas = chartElement.querySelector('#visitorTypeChart')
    if (!canvas) return
    
    const ctx = canvas.getContext('2d')
    
    // Données pour le graphique
    const data = {
      labels: ['Human', 'AI Bot'],
      datasets: [{
        data: [65, 35],
        backgroundColor: ['#333333', '#0A84FF'],
        borderWidth: 0
      }]
    }
    
    // Création du graphique
    new Chart(ctx, {
      type: 'pie',
      data: data,
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'bottom',
            labels: {
              padding: 20,
              usePointStyle: true
            }
          }
        }
      }
    })
  }
} 