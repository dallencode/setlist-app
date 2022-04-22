# frozen_string_literal: true

require_relative '../song'

# Tests:
# Create new instance
# Remove song from array
# Returns an array

describe Song do
  it 'should create a new instance of Song' do
    song = Song.new
    expect(song).to be_kind_of(Song)
  end

  it 'should remove song from array' do
    name = 'Hello'
    artist = 'Adele'
    arr = [{ name: 'Hello', artist: 'Adele' }]
    song = Song.new
    expect(song.remove(name)).to eq([])
  end

  it 'should return an array' do
    song = Song.new
    expect(song.push_to_setlist).to be_a(Array)
  end
end
