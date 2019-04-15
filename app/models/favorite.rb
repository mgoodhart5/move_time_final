class Favorite < ApplicationRecord
  validates_presence_of :location_name
  belongs_to :user
end
