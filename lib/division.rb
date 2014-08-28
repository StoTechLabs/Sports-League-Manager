class Division < ActiveRecord::Base	
 has_many :teams
 has_many :players, through: :teams
 has_many :games, through: :teams
 belongs_to :league
end
