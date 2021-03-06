# frozen_string_literal: true

require_relative 'user'
require_relative 'song'
require_relative 'setlist'
require_relative 'art'
require 'rubygems'
require 'bundler/setup'
require 'colorize'
require 'tty-prompt'

# Print logo and welcome user
puts LOGO.colorize(:green).colorize(background: :black)
puts ''
puts 'Welcome to SetList'.colorize(:light_blue).colorize(background: :black)
puts 'An app for musicians to keep things fresh!'.colorize(:light_blue).colorize(background: :black)
puts ''

# Check if the user has an existing profile (JSON file)
user = User.new
user.check_user_exists
puts ''
# Ask how many songs to be in the set list
if ARGV[1].nil?
  set_length = TTY::Prompt.new
  NUMBER_OF_SONGS = set_length.slider('Enter total number of songs for your set list:', min: 1, max: 20, step: 1,
                                                                                      default: 10)
else
  begin
    if Integer(ARGV[1]) >= 0 && Integer(ARGV[1]) <= 20
      NUMBER_OF_SONGS = Integer(ARGV[1])
    elsif Integer(ARGV[1]) < 0
      NUMBER_OF_SONGS = 10
    else 
      NUMBER_OF_SONGS = 20
    end
  rescue ArgumentError
    set_length = TTY::Prompt.new
    NUMBER_OF_SONGS = set_length.slider('Enter total number of songs for your set list:', min: 1, max: 20, step: 1,
                                                                                        default: 10)
  end
end

prompt = TTY::Prompt.new
song = Song.new

loop do
  choice = prompt.select('What would you like to do?', %w[Add Remove View_Current Fill])
  # add song which WILL BE INCLUDED in final list
  case choice
  when 'Add'
    system('clear') || system('cls')
    puts 'Continue adding songs. Hit enter when finished.'.colorize(:cyan)
    total = 0
    while total < NUMBER_OF_SONGS
      print 'Title: '
      if (title = $stdin.gets.chomp.titleize) == ''
         system('clear') || system('cls')
         break
      end

      print 'Artist: '
      artist = $stdin.gets.chomp.titleize
      song.add(title, artist)
      total += 1
    end

    # Remove song that may have been added accidentally
  when 'Remove'
    system('clear') || system('cls')
    print 'Song to remove: '
    title = $stdin.gets.chomp
    song.remove(title)

    # Shows the current list
  when 'View_Current'
    system('clear') || system('cls')
    final_list = Setlist.new
    final_list.view(song.push_to_setlist)

    # Fills remaining number of spots with songs from starter_list.json
  when 'Fill'
    system('clear') || system('cls')
    user_setlist_filled = song.fill(song.push_to_setlist)
    final_list = Setlist.new
    final_list.view(user_setlist_filled)
    break
  else
    break
  end
end

puts ''
puts "Congratulations, you've made a set list!".green
puts ''
prompt2 = TTY::Prompt.new

loop do
  puts ''
  choice2 = prompt2.select('What would you like to do next?', %w[Export_to_JSON View_Playlist Exit])
  # Writes users new list to their JSON file
  case choice2
  when 'Export_to_JSON'
    File.open("#{user.name.downcase}.json", 'w') do |f|
      f.write(JSON.pretty_generate(song.arr))
    end
    puts 'Successfully Saved to JSON file.'.green
  when 'View_Playlist'
    system('clear') || system('cls')
    final_list = Setlist.new
    final_list.view(song.push_to_setlist)
  when 'Exit'
    system('clear') || system('cls')
    puts 'See you next time!'.light_blue
    puts EXITLOGO.green
    exit
  else
    break
  end
end
