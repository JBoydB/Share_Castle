class Castle < ApplicationRecord
  belongs_to :user

  has_many :user_castles
  has_many :castle_members, through: :user_castles, source: :user
end
