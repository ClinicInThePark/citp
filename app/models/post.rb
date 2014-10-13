class Post < ActiveRecord::Base
	validates :user_id, 	presence: true
	validates :bmi, 		presence: true
	validates :health, 		presence: true
end
