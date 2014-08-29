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
    league_menu
  elsif user_input == '2'
    team_menu
  elsif user_input == '3'
    division_menu
  elsif user_input == '4'
  	game_menu
  elsif user_input == 'x'
    puts "Thanks for using SLM. Have a great day!"
    exit
  else
    puts "Invalid entry"
    main_menu
  end
end

def league_menu
  puts "\n*** LEAGUE MENU ***\n\n"
  choice = nil
  until choice == 'e'
    sleep(1.0)
    puts "Press 'a' to add a LEAGUE, 'l' to list your leagues, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the full name of your new league"
      league_name = gets.chomp
      puts "Enter the name of the sport that will played in this league."
      sport_name = gets.chomp
      new_league = League.create({:name => league_name, :sport => sport_name})
      sleep(1.0)
      puts " New league has been added"
    when 'l'
      League.all.each { |league| puts league.name }
      puts "\n\n"
    when 'r'
      main_menu
    when 'e'
      puts "Bye"
      exit
    else
      puts "That was not a valid entry"
    end
  end
end

def division_menu


end

main_menu

