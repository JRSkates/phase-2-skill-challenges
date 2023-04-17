require 'track'

RSpec.describe Track do
  context 'initilaize' do
    it 'should construct a track with title and artist' do
      track = Track.new("my_title", "my_artist")
      expect(track.title).to eq("my_title")
    end
  end

  context "format" do
    it "formats the title and artist into a single string" do
      track = Track.new("my_title", "my_artist")
      expect(track.format).to eq("my_title by my_artist")
    end
  end
end