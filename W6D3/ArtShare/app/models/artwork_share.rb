class ArtworkShare < ApplicationRecord
    validates :artwork_id , :viewer_id ,presence: true
   
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User

end
