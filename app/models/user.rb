class User < ApplicationRecord
  has_secure_password
  has_many :castles

  has_many :user_castles
  has_many :joined_castles, through: :user_castles, source: :castle, dependent: :destroy
end
