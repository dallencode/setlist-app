require_relative 'setlist'
require_relative 'song'

puts "Welcome to setlist generator"
puts ""
puts "An app for musicians to keep things fresh!"

song = Song.new
loop do
    puts "What would you like to do?"
    choice = gets.chomp.downcase
    if choice == "add"
        
      puts "Continue adding songs. Hit enter when finished."

        loop do
            print "Title: "
            break if (title = gets.chomp) == ""
            print "Artist: "
            artist = gets.chomp
            song.add(title, artist)
        end

    elsif choice == "remove"
        print "Song to remove: "
        title = gets.chomp
        song.remove(title)

    elsif choice == "view"
        final_list = Setlist.new
        final_list.view(song.push_to_setlist)
    else
        break
    end
end
