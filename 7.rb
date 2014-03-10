# Title: 10001st prime
#
# Description:
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

def prime?(n)
  return true if n == 2

  (2..(Math.sqrt(n).to_i + 1)).each { |rn| return false if n % rn == 0 }

  true
end

counter = 0
n = 1

while counter != 10_001
  n += 1
  counter += 1 if prime?(n)
end

puts "The 10 001st prime number is #{n}"
