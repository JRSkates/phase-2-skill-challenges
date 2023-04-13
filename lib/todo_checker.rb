def todo_checker(text)
  todo = "#TODO"
  fail "No text provided" if text.to_s.empty?
  text.to_s.include?("#TODO") ? true : false
end