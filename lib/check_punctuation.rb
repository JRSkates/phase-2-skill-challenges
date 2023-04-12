def check_punctuation(text)
  fail "Not a sentence" if text.empty?
  first_letter_is_capital = text[0] == text[0].upcase
  last_char_is_valid = [".", "?", "!"].include?(text[-1])
  if first_letter_is_capital && last_char_is_valid
    true
  else
    false
  end
end