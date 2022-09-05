class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store
  validates :rating, numericality: { only_integer: true }
 validates :rating, inclusion: { in: 0..5 }
end
