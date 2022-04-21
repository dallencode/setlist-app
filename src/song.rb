class Song
    attr_reader :arr
    
    def initialize
        @arr = []
    end

    def add(name, artist)
        @arr << {name: name, artist: artist}
        puts "#{@arr[-1][:name]} by #{@arr[-1][:artist]} added to your set list."
        return
    end

    def remove(name)
        @arr.delete_if {|h| h[:name] == name.titleize}
    end

    def fill(array)
        fill_arr = []
        array.each do | song |
            fill_arr << song
        end
        file = File.read('starter_list.json')
        data_hash = JSON.parse(file, :symbolize_names => true)

        data_hash.shuffle.each do |item| 
            while @arr.size < NumberOfSongs do
                fill_arr << item
                @arr += fill_arr
            end
            @arr.uniq!
        end
        @arr
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