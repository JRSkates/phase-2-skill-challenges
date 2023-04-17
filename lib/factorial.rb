def factorial(n)
  product = 1
  while n > 0
    binding.irb
    product *= n
    n -= 1
  end
  product
end

puts factorial(5)