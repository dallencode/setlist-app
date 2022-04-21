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
        # user_setlist = Song.new
        # user_setlist_filled = user_setlist.fill(song.push_to_setlist)
        user_setlist_filled = song.fill(song.push_to_setlist)
        final_list = Setlist.new
        final_list.view(user_setlist_filled)
    else
        break
    end
end

