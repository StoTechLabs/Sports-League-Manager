
class League < ActiveRecord::Base	
	has_many :divisions
	has_many :teams, through: :divisions
	validates :name, :presence => true
end