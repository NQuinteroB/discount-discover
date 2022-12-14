class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stores
  has_many :reviews
  acts_as_favoritor

  validates :first_name, :last_name, :username, presence: true
end
