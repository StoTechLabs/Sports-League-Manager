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
  puts "[1] League Menu"
  puts "[2] Division Menu"
  puts "[3] Team Menu"
  puts "[4] Game Menu"
  puts "[x] Exit"
  puts "\n"
  puts "Enter the number of a menu choice to continue"
  user_input = gets.chomp
  if user_input == '1'
    league_menu
  elsif user_input == '2'
    division_menu
  elsif user_input == '3'
    team_menu
  elsif user_input == '4'
  	game_menu
  elsif user_input == 'x'
    puts "Thanks for using SLM. Have a great day!"
    exit
  else
    puts "Invalid entry"
    sleep(2.0)
    main_menu
  end
end

def league_menu
  puts "***LEAGUE MENU***"
  puts "\n*** EMPLOYEE MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to create a league, 'l' to list all leagues,'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the name of the league"
      league_name = gets.chomp
      puts "Enter the name of the sport that will be played in this league"
      sport_choice = gets.chomp
      new_league = League.create({:name =>league_name, :sport => sport_choice})
      puts "League added!"
    when 'l'
      League.all.each { |league| puts league.name }
    when 'r'
      main_menu
    when 'e'
      exit
    else
      puts "That was not a valid entry"
    end
  end
end

def division_menu
  puts "***DIVISION MENU***"
  puts "\n*** EMPLOYEE MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to create a Division, 'l' to list all Divisions, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the name of the Division"
      division_name = gets.chomp
      new_division = Division.create({:name => division_name})
      puts "Now type the name of the league that you want to add this division to from the list below."
      puts "\n"
      League.all.each { |league| puts league.name }
      puts "\n"
      @league_choice = gets.chomp
      League.all.each do |league|
        if league.name == @league_choice
          @league_choice = league
        end
      end
      @league_choice.divisions << new_division
      puts "Division added!"
    when 'l'
      Division.all.each { |division| puts division.name }
    when 'r'
      main_menu
    when 'e'
      exit
    else
      puts "That was not a valid entry"
    end
  end
  
  
end


main_menu

