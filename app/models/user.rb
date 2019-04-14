class User < ApplicationRecord
  validates_presence_of :name

  has_many :user_favorites, dependent: :destroy
  has_many :favorites, through: :user_favorites
end
