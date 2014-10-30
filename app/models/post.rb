class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :user_id, 	presence: true
	validates :bmi, 		presence: true
	validates :health, 		presence: true
	validates :physical, 	presence: true
	validates :dental, 		presence: true
end
