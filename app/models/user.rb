class User < ApplicationRecord
  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  
  validates :name,  presence: true, length: { maximum: 15 }
  
  validates :email, presence: true, length: { maximum: 300 },
            format: { with: VALID_EMAIL_REGEX}
  
  validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角8~32文字小文字・数字それぞれ１文字以上含む必要があります"}
             
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  has_secure_password
  has_many :radios
  has_many :favorites
  has_many :favorite_radios, through: :favorites, source: 'radio'

end
