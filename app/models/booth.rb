class Booth < ActiveRecord::Base
	has_many :attendances, dependent: :destroy
	has_many :events, :through => :attendances, dependent: :destroy
	
	validates :name, presence: true
	validates :service, presence: true
	validates :description,presence: true
	
	def self.to_csv(options = {})
		CSV.generate do |csv|
			csv <<column_names
			all.each do |product|
				csv <<product.attributes.values_at(*column_names)
			end
		end
	end
	
end

