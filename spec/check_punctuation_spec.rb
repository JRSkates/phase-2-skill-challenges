require 'check_punctuation'

RSpec.describe 'check_punctuation' do 
  context "given a empty string" do
    it 'fails' do
      expect {check_punctuation("")}.to raise_error "Not a sentence"
    end
  end

  context "given a sentence with a capital letter and full stop" do
    it 'returns true' do
      result = check_punctuation("Hello world.")
      expect(result).to eq true
    end
  end

  context "given a sentence without a capital letter" do
    it 'returns false' do
      result = check_punctuation("hello world.")
      expect(result).to eq false
    end
  end

  context "given a sentence without a full stop" do
    it 'returns false' do
      result = check_punctuation("Hello world")
      expect(result).to eq false
    end
  end

  context "given a sentence with a full stop or a capital letter" do
    it 'returns false' do
      result = check_punctuation("hello world")
      expect(result).to eq false
    end
  end

  context "given a sentence with an UPCASE first word and full stop" do
    it 'returns true' do
      result = check_punctuation("HELLO world.")
      expect(result).to eq true
    end
  end

  context "given a correct sentence with an exclamation mark on the end" do
    it 'returns true' do
      result = check_punctuation("Hello world!")
      expect(result).to eq true
    end
  end

  context "given a correct sentence with an question mark on the end" do
    it 'returns true' do
      result = check_punctuation("Does this one work too?")
      expect(result).to eq true
    end
  end
end