require 'my_music'

RSpec.describe MyMusic do
  context 'creating a new MyMusic object' do
    it 'initializes correctly' do
      example = MyMusic.new
      expect(example.list).to eq []
    end
  end

  context "Adding songs to the list" do
    it 'returns my list with one song added' do
      example = MyMusic.new
      example.add("Afica")
      expect(example.list).to eq ["Afica"]
    end

    it "returns my list with multiple songs added" do
      example = MyMusic.new
      example.add("Africa")
      example.add("Have You Ever Seen The Rain")
      example.add("Don't Dream It's Over")
      expect(example.list).to eq ["Africa", "Have You Ever Seen The Rain", "Don't Dream It's Over"]
    end

    it "notifies when a song has already been added" do
      example = MyMusic.new
      example.add("Africa")
      expect(example.add("Africa")).to eq "You have already added this song."
    end
  end
end