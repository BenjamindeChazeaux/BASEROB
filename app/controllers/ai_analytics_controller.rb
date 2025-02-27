class AiAnalyticsController < ApplicationController
  def index
    # Placeholder for analytics data
    @analytics_data = {
      visitors: 1250,
      page_views: 3800,
      bounce_rate: 42.5,
      avg_session_duration: "2m 15s"
    }
    
    # Sample data for charts
    @visit_data = {
      labels: ['Human', 'AI Bot'],
      datasets: [{
        data: [65, 35],
        backgroundColor: ['#333333', '#86868b']
      }]
    }
  end
end