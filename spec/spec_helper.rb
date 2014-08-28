require 'active_record'
require 'league'
require 'division'
require 'team'
require 'game'
require 'player'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(development_configuration)

RSpec.configure do |config|
  config.after(:each) do
    League.all.each {|league| league.destroy}
    Division.all.each {|divsion| divsion.destroy}
    Team.all.each {|team| team.destroy}
    Game.all.each {|game| game.destroy}
    Player.all.each {|player| player.destroy}
  end
end