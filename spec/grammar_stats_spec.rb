require 'grammar_stats'

RSpec.describe GrammarStats do
  describe 'check(text)' do
    context "given a empty string" do 
      it 'fails' do
        empty_string = GrammarStats.new
        expect {empty_string.check("")}.to raise_error "Not a valid sentence"
      end
    end

    context "given a sentence with a capital letter and full stop" do
      it 'returns true' do
        result = GrammarStats.new
        expect(result.check("Hello world.")).to eq true
      end
    end

    context "given a sentence without a capital letter" do
        it 'returns false' do
          result = GrammarStats.new
          expect(result.check("hello world.")).to eq false
        end
      end
    
    context "given a sentence without a full stop" do
      it 'returns false' do
        result = GrammarStats.new
        expect(result.check("Hello world")).to eq false
      end
    end
  end

  describe 'percentage_good' do
    context "Returns an number" do
      it'returns a valid integer' do
        result = GrammarStats.new
        result.check("Hello world.")
        expect(result.percentage_good.is_a?(Integer)).to eq true
      end
    end

    context "Returns 100% if 1 check has passes" do
      it'returns 100' do
        result1 = GrammarStats.new
        result1.check("Hello world.")
        expect(result1.percentage_good).to eq 100
      end
    end

    context "Returns 0% if 1 check has failed" do
      it'returns 0' do
        result1 = GrammarStats.new
        result1.check("hello world")
        expect(result1.percentage_good).to eq 0
      end
    end

    context "Returns 75% if 3 out of 4 checks have passed" do
      it'returns 75' do
        result1 = GrammarStats.new
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("hello world")
        expect(result1.percentage_good).to eq 75
      end
    end

    context "Returns 55% if 11 of 20 checks have passed" do
      it'returns 55' do
        result1 = GrammarStats.new
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("Hello world.")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        result1.check("hello world")
        expect(result1.percentage_good).to eq 55
      end
    end
  end
end