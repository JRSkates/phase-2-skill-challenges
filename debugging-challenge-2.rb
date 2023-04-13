def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  p "the cipher is #{cipher}"
  ciphertext_chars = plaintext.chars.map do |char| 
    p "the char is #{char}"
    (65 + char.ord).chr
    p "the char is now #{char}"
  end
  return ciphertext_chars.join
end
  
def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  
  # Intended output:
  #
  # > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
  # => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
  #
  # > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
  # => "theswiftfoxjumpedoverthelazydog"