# Title: Largest prime factor
#
# Description:
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require 'prime'

def trial_division(n)
  return n if n == 1

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

  prime_factors.map { |f| f[0] ** f[1] }.sort
end

largest_prime_factor = trial_division(600851475143).last

puts "The largest prime factor of the number 600851475143 is #{largest_prime_factor}"
