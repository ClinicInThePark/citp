class Event < ActiveRecord::Base
	has_many :attendances
	has_many :booths, :through => :attendances

	#used to allow storage of arrays in db
	serialize :boothlist

	validates :date, presence: true
	validates :location, presence: true
	
	
	
	def self.to_csv(options = {})
		CSV.generate do |csv|
			csv <<column_names
			all.each do |product|
				csv <<product.attributes.values_at(*column_names)
			end
		end
	end
	
end

