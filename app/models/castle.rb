class Castle < ApplicationRecord
  belongs_to :user

  has_many :user_castles, dependent: :destroy
  has_many :castle_members, through: :user_castles, source: :user, dependent: :destroy
  has_many :topics, dependent: :destroy

  has_attached_file :avatar,
                      :styles => { :medium => "150x150>", :thumb => "44x44#" },
                      :default_url => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Bodiam-castle-10My8-1197.jpg/220px-Bodiam-castle-10My8-1197.jpg"

    validates_attachment :avatar, :presence => true,
                         :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
                         :size => { :in => 0..1000.kilobytes }

end
