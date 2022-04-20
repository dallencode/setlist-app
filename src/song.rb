class Song
    attr_reader :arr
    
    def initialize
        @arr = []
    end

    def add(name, artist)
        @arr << {name: name, artist: artist}
        puts "#{@arr[-1][:name]} by #{@arr[-1][:artist]} added to your set list."
    end

    def remove(name)
        @arr.delete_if {|h| h[:name] == name.titleize}
    end

    def push_to_setlist
       @arr
    end
end

LOGO = " _______  _______ _________   _       _________ _______ _________  
(  ____ \(  ____ \\__   __/  ( \      \__   __/(  ____ \\__   __/  
| (    \/| (    \/   ) (     | (         ) (   | (    \/   ) (     
| (_____ | (__       | |     | |         | |   | (_____    | |     
(_____  )|  __)      | |     | |         | |   (_____  )   | |     
      ) || (         | |     | |         | |         ) |   | |     
/\____) || (____/\   | |     | (____/\___) (___/\____) |   | |     
\_______)(_______/   )_(     (_______/\_______/\_______)   )_(     
                                                                   "