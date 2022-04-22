# frozen_string_literal: true

require_relative '../setlist'

# Tests the creation of setlist object and viewing option
describe Setlist do
  it 'should create a new instance of Setlist' do
    setlist = Setlist.new
    expect(setlist).to be_kind_of(Setlist)
  end
  it 'should display current set list' do
    arr = [{ name: 'Hello', artist: 'Adele' }]
    setlist = Setlist.new
    expect(setlist.view(arr)).to eq([{ artist: 'Adele', name: 'Hello' }])
  end
end

# Tests the added method to String class
describe String do
  it 'should capitalise each word' do
    title = String.new
    expect('hello world'.titleize).to eq('Hello World')
  end
end
