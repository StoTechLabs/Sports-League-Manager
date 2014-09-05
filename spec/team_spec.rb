require 'spec_helper'
require 'pry'

describe Team do
	it "should show players and games" do
		test_team = Team.create({:name => 'New Jack City'})
		test_player = Player.create({:name => "Nino Brown"})
		game_date = DateTime.parse('2014-07-29 ')
		test_game = Game.create({:date => game_date})
		test_team.players << test_player
		test_game.teams << test_team
		expect(test_team.players).to eq [test_player]
		expect(test_game.teams).to eq [test_team]
	end

	it "changes the team name to lowercase before it saves" do
		test_team = Team.create({:name => 'New Jack City'})
		expect(test_team.name).to eq 'new jack city'
	end

	it "validates the presence of a name " do
		test_team = Team.create({:name => ''})
		expect(test_team.save).to eq false
	end

	it "should be able to narrow the search of a team by colors" do
		test_team = Team.create({:name => 'New Jack City', :color => 'black'})
		test_team2 = Team.create({:name => "Josh's Cowboys", :color => 'Blue'})
		expect(Team.black).to eq [test_team]
	end

end
