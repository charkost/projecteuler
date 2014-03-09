# Title: Largest palindrome product
#
# Description:
# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindromic?(n)
  n.to_s == n.to_s.reverse
end

palidromes = []

(1..999).each do |i|
  (1..999).each do |j|
    palidromes << i * j if palindromic?(i * j)
  end
end

largest_palidrome = palidromes.sort.last

puts "The largest palindrome made from the product of two 3-digit numbers is #{largest_palidrome}"
