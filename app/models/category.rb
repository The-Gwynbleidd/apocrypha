class Category < ActiveRecord::Base
  # Validations #
  validates :name, presence: true

  # Friedly id #
  extend FriendlyId
  friendly_id :name, use: :slugged
  
end
