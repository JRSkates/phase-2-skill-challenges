require 'make_snippet'

RSpec.describe 'make_snippet' do
  it "fails if the string is empty" do
    expect { make_snippet('') }.to raise_error 'String is empty'
  end

  it 'returns the word unchanged if its 5 words' do
    result = make_snippet("This is a test sentence")
    expect(result).to eq("This is a test sentence")
  end

  it "adds ... to the end of the word if it's 6 words or longer" do
    result = make_snippet("This is a test sentence again")
    expect(result).to eq("This is a test sentence...")
  end
end