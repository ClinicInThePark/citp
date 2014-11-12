class Event < ActiveRecord::Base
	has_and_belongs_to_many :booths
	serialize :boothlist, Array

	validates :date, presence: true
	validates :location, presence: true

	def boothlist=(commands)
    	commands.reject(&:blank?)
    end
  


end
