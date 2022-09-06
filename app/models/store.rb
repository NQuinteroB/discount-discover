class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  acts_as_favoritable
  
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, :address, :opening_hour, :closing_hour, presence: true

   include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [ :name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
