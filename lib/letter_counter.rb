# File: letter_counter.rb

class LetterCounter
  def initialize(text)
    @text = text
  end
  
  def calculate_most_common()
    fail "No string given" if @text.empty?
    hash = Hash.new(0)
    @text.downcase.chars.each do |letter| 
      next unless is_letter?(letter)
      hash[letter] += 1
    end
    hash.max_by{|k,v| v}.reverse!
  end
  
  private
  
  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end
  
counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common
  
  # Intended output:
  # [2, "i"]