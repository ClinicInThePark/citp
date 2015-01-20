class Attendance < ActiveRecord::Base
	belongs_to :event
	belongs_to :booth

	validates :booth_id, presence: true
	validates :booth_attendance, presence: true
	
	def self.to_csv(options = {})
		CSV.generate do |csv|
			csv <<column_names
			all.each do |product|
				csv <<product.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path,headers: true) do |row|
			Product.create! row.to_hash
		end
	end
end
