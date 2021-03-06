class Team < ActiveRecord::Base
	has_many :players	
	belongs_to :game
	belongs_to :division
	before_save	:downcase_name
	validates :name, :presence => true

	
	private

	def downcase_name
		self.name = self.name.downcase
	end

	scope :black, -> { where( color: 'black' ) }

end