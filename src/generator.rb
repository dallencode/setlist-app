require_relative 'setlist'
require_relative 'song'
require_relative 'user'
require 'rubygems'
require 'bundler/setup'
require 'colorize'
require "tty-prompt"

puts LOGO.green

puts "Welcome to SetList".colorize(:light_blue ).colorize( :background => :black)
puts "An app for musicians to keep things fresh!".colorize(:light_blue ).colorize( :background => :black)
puts ""

user = User.new
user.check_user_exists

set_length = TTY::Prompt.new
NumberOfSongs = set_length.slider("Enter total number of songs for your set list:", min: 1, max: 20, step: 1, default: 10)

prompt = TTY::Prompt.new
song = Song.new

loop do
    choice = prompt.select("What would you like to do?", %w(Add Remove View_Current Fill))
    
    if choice == "Add"  
        system("clear") || system("cls")
      puts "Continue adding songs. Hit enter when finished.".colorize(:cyan)
        total = 0
        while total < NumberOfSongs do
            print "Title: "
            break if (title = gets.chomp.titleize) == ""
            print "Artist: "
            artist = gets.chomp.titleize
            song.add(title, artist)
            total += 1
        end

    elsif choice == "Remove"
        system("clear") || system("cls")
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
        File.open("#{user::name.downcase}.json", "w") do |f|
            f.write(JSON.pretty_generate(song::arr))
        end
    elsif choice2 == "Exit"
        puts "See you next time!"
        exit
    else 
        break 
    end
end
