class Consultation < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, :email, :date, presence: true
end 