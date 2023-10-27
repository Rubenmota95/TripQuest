class Place < ApplicationRecord
  has_many_attached :photos
  has_many :favorites
  has_many :users, through: :favorites
end
