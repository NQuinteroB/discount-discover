class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :store
  validates :name, presence: true
end
