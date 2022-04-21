require_relative '../setlist'

describe Setlist do

    it 'should create a new instance of Setlist' do
        setlist = Setlist.new
        expect(setlist).to be_kind_of(Setlist)
    end
    it 'should display current set list' do
        arr = [{name: "Hello", artist: "Adele"}]
        setlist = Setlist.new
        expect(setlist.view(arr)).to eq([{:artist=>"Adele", :name=>"Hello"}])
    end
end

describe String do
    it 'should capitalise each word' do
        title = String.new
        expect("hello world".titleize).to eq("Hello World")
    end
end