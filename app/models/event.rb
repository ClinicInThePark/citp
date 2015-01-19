class Event < ActiveRecord::Base
	has_many :attendances
	has_many :booths, :through => :attendances

	#used to allow storage of arrays in db
	serialize :boothlist

	validates :date, presence: true
	validates :location, presence: true
	
end

