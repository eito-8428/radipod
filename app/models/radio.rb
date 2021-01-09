class Radio < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :audio, presence: true
  validates :title, presence: true
  
   belongs_to :user, optional: true
   mount_uploader :audio, AudioUploader
   has_many :favorites
   has_many :favorite_users, through: :favorites, source: 'user'
end
