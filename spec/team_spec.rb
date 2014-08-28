require 'spec_helper'

describe Team do
	it "should show players and games" do
		test_team = Team.create({:name => 'New Jack City'})		
		test_player = Player.create({:name => "Nino Brown"})
		test_game = Game.create({:date => '2014-07-29'})
		test_team.players << test_player
		test_player.games << test_game
		expect(test_team.players).to eq test_player
		expect(test_team.game).to eq test_game
	end
end