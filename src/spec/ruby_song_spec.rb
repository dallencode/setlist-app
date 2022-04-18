require_relative '../song'

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