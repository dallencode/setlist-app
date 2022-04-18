class Song
    def initialize
        @arr = []
    end

    def add(name, artist)
        @arr << {name: name, artist: artist}
    end

    def remove(name)
        @arr.delete_if {|h| h[:name] == name}
    end

    def push_to_setlist
       @arr
    end
end

# list = Song.new
# list.add("hello", "adele")
# list.remove("hello")
# list.add("123", '12')
# p list.push_to_setlist