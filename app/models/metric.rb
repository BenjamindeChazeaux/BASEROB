class Metric < ApplicationRecord
  belongs_to :user
  belongs_to :report, optional: true
  
  # Inclure le module Filterable pour faciliter le filtrage
  include Filterable
  
  # Scopes
  scope :for_user, ->(user) { where(user: user) }
  scope :in_date_range, ->(range) { where(created_at: DateRangeService.calculate_range(range)) }
  scope :main_metrics, -> { where(is_main: true) }
  scope :daily, -> { where(period_type: 'daily') }
  scope :group_by_day, -> { group("DATE(created_at)").select("DATE(created_at) as date, SUM(value) as total") }
  scope :group_by_category, -> { group(:category) }
  
  # Méthodes d'instance
  def previous_value
    previous_metric = Metric.for_user(user)
                           .where(name: name)
                           .where("created_at < ?", created_at)
                           .order(created_at: :desc)
                           .first
                           
    previous_metric&.value || 0
  end
  
  # Méthodes de classe
  def self.apply_filters(filters)
    result = self
    
    filters.each do |key, value|
      result = result.public_send("filter_by_#{key}", value) if value.present?
    end
    
    result
  end
  
  # Filtres dynamiques définis dans le module Filterable
  filter_by :category
  filter_by :source
  filter_by :metric_type
end 