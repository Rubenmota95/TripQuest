class Place < ApplicationRecord
  has_many_attached :photos
  has_many :favorites
  has_many :comments
  has_many :users, through: :favorites
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
