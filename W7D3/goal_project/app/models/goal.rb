class Goal < ApplicationRecord
    validates :name, presence: true
    validates   :user_id ,presence: true , uniqueness: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

end
