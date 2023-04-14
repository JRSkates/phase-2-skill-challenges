require 'gratitudes'

RSpec.describe Gratitudes do
  context "Testing if the basic class methods are working" do
    it  do
      gratitudes = Gratitudes.new
      gratitudes.add("your cat")
      gratitudes.add("nice people")
      expect(gratitudes.format).to eq "Be grateful for: your cat, nice people"
    end
  end
end