class Post < ApplicationRecord

	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :content, presence: true, length: { minimum: 10, maximum: 1000 }

	has_many :comments, dependent: :destroy

	belongs_to :user

end
