class Comment < ApplicationRecord
	validates :description, presence: true, length: { maximum: 80 }

  belongs_to :user
  belongs_to :pic
end
