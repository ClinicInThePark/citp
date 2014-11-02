class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :id, presence: true
	validates :user_id, presence: true

end
