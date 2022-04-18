require_relative '../song'
# require_relative '../user'
require_relative '../setlist'

describe Song do
    it 'should add new song to array' do
        name = "Hello"
        artist = "Adele"
        song = Song.new
        expect(song.add(name, artist)).to eq([{name: "Hello", artist: "Adele"}])
    end

    it 'should remove song from array' do
        name = "Hello"
        artist = "Adele"
        arr = [{name: "Hello", artist: "Adele"}]
        song = Song.new
        expect(song.remove(name)).to eq([])
    end
end

describe Setlist do
    it 'should display current set list' do
        setlist = Setlist.new
    end
end