require 'spec_helper'
require 'pry'

describe League do
	it "should show its divisions" do
		test_league = League.create({:name => "Flag Football"})
		test_division = Division.create({:name => "Division A"})
		test_team = Team.create({:name => 'New Jack City'})
		test_division.teams << test_team
		test_league.divisions << test_division
		expect(test_league.divisions).to eq [test_division]
	end
end

