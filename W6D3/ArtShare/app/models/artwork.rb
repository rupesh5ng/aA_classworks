class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id ,presence: true
    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User
    has_many :shared_viewers,
        through: :artwork_share,
        source: :viewer
    has_many :artwork_shares

end
