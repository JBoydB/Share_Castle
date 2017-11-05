class Castle < ApplicationRecord
  belongs_to :user

  has_many :user_castles, dependent: :destroy
  has_many :castle_members, through: :user_castles, source: :user, dependent: :destroy
  has_many :topics, dependent: :destroy
end
