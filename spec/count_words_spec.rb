require 'count_words'

RSpec.describe 'count_words' do
  it 'returns 5 when given a 5 word sentence' do
    result = count_words('hello world it is me')
    expect(result).to eq(5)
  end

  it 'returns 1 when given a single world' do
    result = count_words('hello')
    expect(result).to eq(1)
  end

  it 'can count longer sentences' do
    result = count_words('1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26')
    expect(result).to eq(26)
  end
end