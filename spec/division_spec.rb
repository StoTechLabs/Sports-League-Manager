require 'spec_helper'

describe Division do
	it "should show its teams" do
		test_division = Division.create({:name => "Division A"})
		test_team = Team.create({:name => 'New Jack City'})
		test_division.teams << test_team
		expect(test_division.teams).to eq [test_team]
	end
end




