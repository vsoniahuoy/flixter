class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  mount_uploader :image, ImageUploader
end
