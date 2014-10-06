class Post < ActiveRecord::Base
	belongs_to :user
	
	validates :userid, 		presence: true
	validates :Safety, 		presence: true
	validates :BMI, 		presence: true
	validates :Children, 	presence: true
	validates :Health, 		presence: true
end
