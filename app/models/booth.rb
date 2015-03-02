class Booth < ActiveRecord::Base
	has_many :attendances, dependent: :destroy
	has_many :events, :through => :attendances, dependent: :destroy
	
	validates :name, presence: true
	validates :service, presence: true
	validates :description,presence: true
end

