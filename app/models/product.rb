class Product < ApplicationRecord
  belongs_to :store

  validates :name, :price, :discount, :active, presence: true
end
