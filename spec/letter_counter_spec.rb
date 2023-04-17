require 'letter_counter'

RSpec.describe LetterCounter do
  context "Returns the letter that occurs most often and the amount of times it occurs" do
    it "returns [2, i]" do
      counter = LetterCounter.new("Digital Punk")
      expect(counter.calculate_most_common).to eq([2, "i"])
    end

    it "Fails if no string is passed" do
     counter = LetterCounter.new("")
     expect{counter.calculate_most_common}.to raise_error "No string given"
    end
  end
end