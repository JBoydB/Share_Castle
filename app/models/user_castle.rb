class UserCastle < ApplicationRecord
  belongs_to :user
  belongs_to :castle
end
