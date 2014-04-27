# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
# 
#   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
#   Let us list the factors of the first seven triangle numbers:
# 
#      1: 1
#      3: 1,3
#      6: 1,2,3,6
#      10: 1,2,5,10
#      15: 1,3,5,15
#      21: 1,3,7,21
#      28: 1,2,4,7,14,28
# 
# We can see that 28 is the first triangle number to have over five divisors.
# 
# What is the value of the first triangle number to have over five hundred divisors?

require 'prime'

# Finds the prime factors of a given number.
def trial_division(n)
  return [n] if n == 1

  primes = Prime.each(Math.sqrt(n).to_i + 1).to_a
  prime_factors = []

  primes.each do |p|
    next if p * p > n

    counter = 1

    while n % p == 0
      if counter == 1
        prime_factors << [p, 1]
      else
        prime_factors.last[1] = counter
      end

      counter += 1
      n /= p
    end
  end

  prime_factors << [n, 1] if n > 1
  prime_factors
end

# Calculates the number of divisors of a number by multiplying the powers (increased by one) of the prime 
# factors of this number.
def number_of_divisors(n)
  trial_division(n).inject(1) { |sum, pf| sum * (pf[1] + 1) }
end

step = 1
triangle = 1

while number_of_divisors(triangle) <= 500
  step += 1
  triangle += step
end

puts "The value of the first triangle number to have over five hundred divisors is #{triangle}."
