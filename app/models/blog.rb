class Blog < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :blog_id, presence: true
    

    has_many :comments
    has_many :users, through: :comments
end
