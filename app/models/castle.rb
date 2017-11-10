class Castle < ApplicationRecord
  belongs_to :user

  has_many :user_castles, dependent: :destroy
  has_many :castle_members, through: :user_castles, source: :user, dependent: :destroy
  has_many :topics, dependent: :destroy

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>" }, default_url: "https://s3-us-west-1.amazonaws.com/sharecastlefiles/pexels-photo-406014.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
