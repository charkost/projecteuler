# Title: Smallest multiple
#
# Description:
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
# without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers
# from 1 to 20?

def gcd(a, b)
  nums = [a, b].sort

  last_remainder = nums[0]

  while (remainder = nums[1] % nums[0]) != 0
    nums[1] = nums[0]
    nums[0] = remainder
    last_remainder = remainder
  end

  last_remainder
end

def lcm(a, b)
  (a * b).abs / gcd(a, b)
end

def multi_lcm(nums)
  nums.inject { |prev_lcm, n| lcm(prev_lcm, n) }
end

puts "The smallest positive number that is evenly divisible by all of the numbers from 1 to 20 is #{multi_lcm(1..20)}"
