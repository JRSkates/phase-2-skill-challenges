require 'todo_checker'

RSpec.describe 'todo_checker' do
  context "given an empty string" do
    it 'fails' do
      expect { todo_checker("")}.to raise_error "No text provided"
    end
  end

  context "given just '#TODO' in a string" do
    it 'returns true' do
      expect(todo_checker("#TODO")).to be true
    end
  end

  context "given hello world as a string" do
    it 'returns false' do
      expect(todo_checker("hello world")).to be false
    end
  end

  context "given TODO as a string without #" do
    it 'returns false' do
      expect(todo_checker("TODO")).to be false
    end
  end

  context "text with #TODO at the end" do
    it'returns true' do
      expect(todo_checker('pre text #TODO')).to be true
    end
  end

  context "text with #TODO at the beginning" do
    it 'returns true' do
      expect(todo_checker('#TODO post text')).to be true
    end
  end

  context "Integers returns false" do
    it'returns false' do
      expect(todo_checker(3454)).to be false
    end
  end
end