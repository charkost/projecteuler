# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# 
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def triplet(sum)
  for a in 0...sum / 3 do
    for b in a...sum / 2 do
      c = sum - (a + b)
      return [a, b, c] if a ** 2 + b ** 2 == c ** 2
    end
  end
end

product = triplet(1000).reduce(:*) 

puts "The product of the Pythagorean triplet for which a + b + c = 1000 is #{product}"
