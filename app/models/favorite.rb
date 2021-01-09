class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :radio
  
  validates_uniqueness_of :radio_id, scope: :user_id
end
