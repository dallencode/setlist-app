require_relative 'user'
require_relative 'song'
require_relative 'setlist'
require 'rubygems'
require 'bundler/setup'
require 'colorize'
require 'tty-prompt'

# Print logo and welcome user
puts LOGO.colorize(:green).colorize(background: :black)
puts 'Welcome to SetList'.colorize(:light_blue).colorize(background: :black)
puts 'An app for musicians to keep things fresh!'.colorize(:light_blue).colorize(background: :black)
puts ''

# Check if the user has an existing profile (JSON file)
user = User.new
user.check_user_exists

# Ask how many songs to be in the set list
set_length = TTY::Prompt.new
NumberOfSongs = set_length.slider('Enter total number of songs for your set list:', min: 1, max: 20, step: 1,
                                                                                    default: 10)

prompt = TTY::Prompt.new
song = Song.new


loop do
  choice = prompt.select('What would you like to do?', %w[Add Remove View_Current Fill])
# add song which WILL BE INCLUDED in final list
  if choice == 'Add'
    system('clear') || system('cls')
    puts 'Continue adding songs. Hit enter when finished.'.colorize(:cyan)
    total = 0
    while total < NumberOfSongs
      print 'Title: '
      break if (title = STDIN.gets.chomp.titleize) == ''

      print 'Artist: '
      artist = STDIN.gets.chomp.titleize
      song.add(title, artist)
      total += 1
    end

    # Remove song that may have been added accidentally
  elsif choice == 'Remove'
    system('clear') || system('cls')
    print 'Song to remove: '
    title = STDIN.gets.chomp
    song.remove(title)

    # Shows the current list
  elsif choice == 'View_Current'
    system('clear') || system('cls')
    final_list = Setlist.new
    final_list.view(song.push_to_setlist)

    # Fills remaining number of spots with songs from starter_list.json
  elsif choice == 'Fill'
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
puts "Congratulations, you've made a set list!".magenta
puts ''
prompt2 = TTY::Prompt.new

loop do
  puts ''
  choice2 = prompt2.select('What would you like to do next?', %w[Export_to_JSON View_Playlist Exit])
# Writes users new list to their JSON file
  if choice2 == 'Export_to_JSON'
    File.open("#{user.name.downcase}.json", 'w') do |f|
      f.write(JSON.pretty_generate(song.arr))
    end
    puts 'Successfully Saved to JSON file.'.green
  elsif choice2 == 'View_Playlist'
    system('clear') || system('cls')
    final_list = Setlist.new
    final_list.view(song.push_to_setlist)
  elsif choice2 == 'Exit'
    puts 'See you next time!'.light_blue
    exit
  else
    break
  end
end
