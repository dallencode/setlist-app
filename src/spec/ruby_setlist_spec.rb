require_relative '../setlist'

describe Setlist do
    it 'should display current set list' do
        arr = [{name: "Hello", artist: "Adele"}]
        setlist = Setlist.new
        expect(setlist.view(arr)).to eq("1. Hello by Adele")
    end
end