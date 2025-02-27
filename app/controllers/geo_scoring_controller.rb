class GeoScoringController < ApplicationController
  def index
    # Données factices pour la démo
    @metrics = {
      visibility_score: {
        value: 87.3,
        change: -0.2,
        trend: 'down'
      },
      average_position: {
        value: 1.4,
        change: -0.2,
        trend: 'down'
      },
      detection_rate: {
        value: 88.7,
        change: 0.5,
        trend: 'up'
      },
      top_3_visibility: {
        value: 84.7,
        change: -0.1,
        trend: 'down'
      }
    }

    @competitors = [
      {
        name: 'Your Company',
        score: 87.3,
        change: -0.2,
        trend: 'down'
      },
      {
        name: 'Competitor A',
        score: 95.2,
        change: 0.5,
        trend: 'up'
      },
      {
        name: 'Competitor B',
        score: 90.9,
        change: 0.0,
        trend: 'neutral'
      }
    ]

    # Données pour le graphique de performance
    @performance_data = {
      labels: (1..12).map { |i| "8/#{i}/2025" },
      datasets: [
        {
          label: 'Your Company',
          data: [87.3, 87.1, 86.9, 87.2, 87.4, 87.1, 86.8, 86.9, 87.0, 87.2, 87.3, 87.1]
        },
        {
          label: 'Competitor A',
          data: [95.0, 95.1, 95.2, 95.1, 95.3, 95.2, 95.1, 95.2, 95.3, 95.2, 95.1, 95.2]
        }
      ]
    }
  end
end 