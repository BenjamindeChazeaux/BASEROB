import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timeseriesChart", "pieChart"]

  connect() {
    this.initializeCharts()
  }

  initializeCharts() {
    this.initializeTimeseriesChart()
    this.initializePieChart()
  }

  initializeTimeseriesChart() {
    const chartElement = this.timeseriesChartTarget
    const canvas = chartElement.querySelector('#trafficChart')
    if (!canvas) return

    const ctx = canvas.getContext('2d')
    const data = JSON.parse(chartElement.dataset.timeseriesData)

    new Chart(ctx, {
      type: 'line',
      data: data,
      options: {
        responsive: true,
        maintainAspectRatio: false,
        interaction: {
          mode: 'index',
          intersect: false,
        },
        plugins: {
          legend: {
            position: 'top',
            labels: {
              usePointStyle: true,
              padding: 20
            }
          },
          tooltip: {
            mode: 'index',
            intersect: false
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            grid: {
              color: 'rgba(0, 0, 0, 0.05)'
            },
            ticks: {
              callback: function(value) {
                return value.toLocaleString()
              }
            }
          },
          x: {
            grid: {
              display: false
            }
          }
        }
      }
    })
  }

  initializePieChart() {
    const chartElement = this.pieChartTarget
    const canvas = chartElement.querySelector('#visitsChart')
    if (!canvas) return

    const ctx = canvas.getContext('2d')
    const data = JSON.parse(canvas.dataset.visitData)

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