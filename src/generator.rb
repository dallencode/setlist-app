require_relative 'setlist'
require_relative 'song'
require_relative 'user'
require 'rubygems'
require 'bundler/setup'
require 'colorize'
require "tty-prompt"

puts LOGO.green

puts "Welcome to SetList"
puts "An app for musicians to keep things fresh!"
puts ""

user = User.new
user.check_user_exists

set_length = TTY::Prompt.new
NumberOfSongs = set_length.ask("Enter total number of songs for your set list:", default: 10, convert: :int) do |q|
  q.convert(:integer, "Please Enter Digits Only")
end

prompt = TTY::Prompt.new
song = Song.new

loop do
    choice = prompt.select("What would you like to do?", %w(Add Remove View_Current Fill))
    
    if choice == "Add"  
      puts "Continue adding songs. Hit enter when finished."

        loop do
            print "Title: "
            break if (title = gets.chomp.titleize) == ""
            print "Artist: "
            artist = gets.chomp.titleize
            song.add(title, artist)
        end

    elsif choice == "Remove"
        print "Song to remove: "
        title = gets.chomp
        song.remove(title)

    elsif choice == "View_Current"
        system("clear") || system("cls")
        puts "Your current set list (#{song::arr.size} items):"
        final_list = Setlist.new
        final_list.view(song.push_to_setlist)

    elsif choice == "Fill"
        system("clear") || system("cls")
        user_setlist_filled = song.fill(song.push_to_setlist)
        final_list = Setlist.new
        final_list.view(user_setlist_filled)
        break
    else
        break
    end
end

puts ""
puts "Congratulations, you've made a set list!"
puts ""
prompt2 = TTY::Prompt.new

loop do
    choice2 = prompt2.select("What would you like to do next?", %w(Export_to_JSON Exit))

    if choice2 == "Export_to_JSON"
        # export = User.new.write_to_json(song::arr)
        File.open("#{user::name.downcase}.json", "w") do |f|
            f.write(JSON.pretty_generate(song::arr))
        end
    elsif choice2 == "View_Current"
    elsif choice2 == "Exit"
        puts "See you next time!"
        exit
    else 
        break 
    end
end
