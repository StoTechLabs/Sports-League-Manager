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
  puts "[4] Player Menu"
  puts "[5] Game Menu"
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
  	player_menu
  elsif user_input == '5'
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
  puts "\n*** LEAGUE MENU ***\n\n"
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
  puts "\n***DIVISION MENU ***\n\n"
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

def team_menu
  puts "\n*** TEAM MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to create a Team, 'l' to list all Teams, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the name of the team"
      team_name = gets.chomp
      puts "Enter the color of the team"
      team_color = gets.chomp
      new_team = Team.create({:name => team_name, :color => team_color})
      puts "Now type the name of the division that you want to add this team to from the list below."
      puts "\n"
      Division.all.each { |division| puts division.name }
      puts "\n"
      @division_choice = gets.chomp
      Division.all.each do |division|
        if division.name == @division_choice
          @division_choice = division
        end
      end
      @division_choice.teams << new_team
      puts "Team added!"
    when 'l'
      Team.all.each { |team| puts team.name }
    when 'r'
      main_menu
    when 'e'
      exit
    else
      puts "That was not a valid entry"
    end
  end
end


def player_menu
  puts "\n*** PLAYER MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to register a player, 'l' to list all players, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the full name of the player"
      player_name = gets.chomp
      new_player = Player.create({:name => player_name})
      puts "Now type the name of the team that you want to add this player to to from the list below."
      puts "\n"
      Team.all.each { |team| puts team.name }
      puts "\n"
      @team_choice = gets.chomp
      Team.all.each do |team|
        if team.name == @team_choice
          @team_choice = team
        end
      end
      @team_choice.players << new_player
      puts "player added!"
    when 'l'
      Player.all.each { |player| puts player.name }
    when 'r'
      main_menu
    when 'e'
      exit
    else
      puts "That was not a valid entry"
    end
  end
end

def game_menu
  puts "\n*** GAME MENU ***\n\n"
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add a game to the schedule, 'l' to list all game dates, 'r' return to Main menu"
    puts "Press 'e' to exit"
    choice = gets.chomp
    case choice
    when 'a'
      puts "Enter the date of your new game in the this format 'yyyy-mm-dd'"
      game_date = gets.chomp
      new_game = Game.create({:date => game_date})
      puts "Now type the name of the first team that you want to play on this date to to from the list below."
      puts "\n"
      Team.all.each { |team| puts team.name }
      puts "\n"
      @team_choice = gets.chomp
      Team.all.each do |team|
        if team.name == @team_choice
          @team_choice = team
        end
      end
      new_game.teams << @team_choice
      puts "team added!"
      sleep(2.0)
      puts "Now type the name of the second team that you want to play on this date to to from the list below."
      puts "\n"
      Team.all.each { |team| puts team.name }
      puts "\n"
      @team_choice = gets.chomp
      Team.all.each do |team|
        if team.name == @team_choice
          @team_choice = team
        end
      end
      new_game.teams << @team_choice
      puts "second tead has been added. Game scheduled!"
    when 'l'
      Game.all.each { |game| puts game.date }
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
