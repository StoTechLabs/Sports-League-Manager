require 'active_record'
require './lib/league'
require './lib/game'
require './lib/player'
require './lib/team'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
	system('clear')
  puts "***Sports League Manager***"
  puts "[1] Create League"
  puts "[2] Create Division"
  puts "[3] Create Team"
  puts "[4] Create Game"
  puts "[x] Exit"
  puts "\n"
  puts "Enter the number of a menu choice to continue"
  user_input = gets.chomp
  if user_input == '1'
    create_league
  elsif user_input == '2'
    create_team
  elsif user_input == '3'
    create_division
  elsif user_input == '4'
  	create_game
  elsif user_input == 'x'
    puts "Thanks for using SLM. Have a great day!"
    exit
  else
    puts "Invalid entry"
    main_menu
  end
end

main_menu

