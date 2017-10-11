class User < ApplicationRecord
  has_many :castles

  has_many :user_castles
  has_many :joined_castles, through: :user_castles, source: :castle
end
