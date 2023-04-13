def factorial(n)
  product = 1
  while n > 1
    product *= n
    n -= 1
  end
  product
end

puts factorial(5)

# Inteded output
# factorial(5)
# => 120