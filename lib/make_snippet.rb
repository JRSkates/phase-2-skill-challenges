def make_snippet(str)
  if str.to_s.split(" ").length <= 5
    return str
  else
    first_5 = str.to_s.split(" ").slice(0, 5).join(" ")
    return "#{first_5}..."
  end
end