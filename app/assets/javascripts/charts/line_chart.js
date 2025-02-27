// Pseudo-code:
// 1. Fonction pour initialiser un graphique linéaire
// 2. Configuration des options du graphique
// 3. Gestion des mises à jour et des interactions

function initLineChart(elementId) {
  const canvas = document.getElementById(elementId);
  if (!canvas) return;
  
  const chartData = JSON.parse(canvas.dataset.chart);
  
  new Chart(canvas.getContext('2d'), {
    type: 'line',
    data: {
      labels: chartData.labels,
      datasets: chartData.datasets
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: {
          beginAtZero: true
        }
      },
      plugins: {
        tooltip: {
          mode: 'index',
          intersect: false
        },
        legend: {
          position: 'top'
        }
      }
    }
  });
}

// Fonction pour mettre à jour le graphique avec de nouvelles données
function updateLineChart(elementId, newData) {
  const canvas = document.getElementById(elementId);
  if (!canvas) return;
  
  const chart = Chart.getChart(canvas);
  if (!chart) return;
  
  chart.data.labels = newData.labels;
  chart.data.datasets = newData.datasets;
  chart.update();
} 