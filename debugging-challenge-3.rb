def get_most_common_letter(text)
    counter = Hash.new(0)
    # p counter
    text.chars.each do |char|
      # p char
      counter[char] += 1 unless char == " "
      # p counter[char]
      # p counter
    end
    counter.max_by { |k, v| v }[0]
  end
  
  # Intended output:
  # 
  puts get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"

  # Checked the Hash
  # Checked the char and the counter[char] on each loop
  # Saw we were getting the hash correctly - k v pairs of characters and the number of occurrences
  # output was wrong, p out the final return to see the full output
  # adjusted the final method to give us the key of the highest value
  # adjusted the code within the each loop to ignore spaces as a character as that was passing as the highest value
  # correct output achieved!