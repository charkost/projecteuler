# Title: Summation of primes
# Description:
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def prime?(n)
  return false if n == 1
  return true if n == 2

  (2..(Math.sqrt(n).to_i + 1)).each { |rn| return false if n % rn == 0 }

  true
end

sum = 0

2_000_000.times do |n|
  sum += n if prime?(n)
end

puts "The sum of all the primes below two million is #{sum}"
