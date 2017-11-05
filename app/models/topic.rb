class Topic < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :urls, dependent: :destroy
  belongs_to :castle
end
