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
set_length = TTY::Prompt.new

NumberOfSongs = set_length.ask("Enter total number of songs for your set list:", default: 10, convert: :int) do |q|
  q.convert(:integer, "Please Enter Digits Only")
end

prompt = TTY::Prompt.new
song = Song.new

loop do
    choice = prompt.select("What would you like to do?", %w(Add Remove View_Current Generate_New))
    # choice = gets.chomp.downcase
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
        elsif choice == "Generate_New"
    else
        break
    end
end
