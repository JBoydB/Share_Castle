class Topic < ApplicationRecord
  has_many :entries, dependent: :destroy
  belongs_to :castle
end
