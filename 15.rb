# How many such routes are there through a 20×20 grid?

size = 21 

grid = []

size.times do |i|
  grid << [1]
  grid [0][i] = 1
end

(1...size).each do |i|
  (1...size).each do |j|
    grid[i][j] = grid[i - 1][j] + grid[i][j - 1]
  end
end

puts grid.flatten.last
