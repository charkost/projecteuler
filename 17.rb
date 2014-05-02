# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
# The use of "and" when writing out numbers is in compliance with British usage.

def map
  {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }
end

def str_from_num(num)
  str = ''

  num_of_thousands = num / 1000
  rest_num = num - (num_of_thousands * 1000)

  if num_of_thousands > 0
    str << "#{map[num_of_thousands]} thousand"
    str << 'and ' if rest_num > 0
  end

  num_of_hundreds = rest_num / 100
  rest_num -= num_of_hundreds * 100

  if num_of_hundreds > 0
    str << "#{map[num_of_hundreds]} hundred "
    str << 'and ' if rest_num > 0
  end

  if rest_num <= 20 && rest_num > 0
    str << "#{map[rest_num]}"
    rest_num = 0
  else
    num_of_tens = rest_num / 10
    rest_num -= num_of_tens * 10
  end

  str << "#{map[num_of_tens * 10]} " if num_of_tens && num_of_tens > 0

  str << "#{map[rest_num]}" if rest_num > 0

  str
end

str = ''

(1..1000).each do |num|
  str << str_from_num(num)
end

str.gsub!(' ', '')

puts str.size
