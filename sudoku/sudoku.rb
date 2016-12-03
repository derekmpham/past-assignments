require 'pp'

SOLUTION = '111111111222222222333333333444444444555555555666666666777777777888888888999999999'

def numbers
  (1..9).to_a
end

def grid(board)
  board.chars.each_slice(9).map {|row| row.map(&:to_i)}
end

def rows(grid)
  rows = Array.new

  grid.each do |row|
    rows << row
  end
  rows
end

def columns(grid)
  columns = Array.new

  grid.each_with_index do |row, row_index|
    vertical_scope = grid.map {|row| row[row_index]}
    columns << vertical_scope
  end
  columns
end

def boxes(grid)
  boxes = Hash.new { |h, k| h[k] = Array.new }

  rows(grid).each_with_index do |row, row_index|
    columns(grid).each_with_index do |column, column_index|
      # Increase box number as remainder from dividing
      box = (column_index / 3) + (3 * (row_index / 3))
      boxes[box] << row[column_index]
    end
  end

  boxes
end

def validate(n)
  n.length > 1 ? n : n.first
end

def generate_possibles(grid)
  # TODO: Fix solver logic
  rows = rows(grid)
  columns = columns(grid)
  boxes = boxes(grid)

  grid.each_with_index do |row, row_index|
    row.each_with_index do |square, column_index|
      box = (column_index / 3) + (3 * (row_index / 3))
      if numbers.include? square
        grid[row_index][column_index] = square
      else
        possibles = numbers - (rows[row_index] + columns[column_index] + boxes[box])
        grid[row_index][column_index] = validate(possibles)
      end
    end
  end
  grid
end

def possibilities(grid)
  # TODO: Fix solver logic
  grid = generate_possibles(grid)
  return grid if grid.flatten.length == 81
  rows = rows(grid)
  columns = columns(grid)
  boxes = boxes(grid)

  grid.each_with_index do |row, row_index|
    row.each_with_index do |square, column_index|
      box = (column_index / 3) + (3 * (row_index / 3))
      if numbers.include? square
        grid[row_index][column_index] = square
      else
        possibles = numbers - (rows[row_index] + columns[column_index] + boxes[box])
        grid[row_index][column_index] = possibles.sample
      end
    end
  end

  possibilities(grid)
end

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board)
  sudoku_grid = grid(board)
  solved_board = possibilities(sudoku_grid)
  solved_board.join('')
end
  
# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  board.chars.sort.join == SOLUTION
end
  
# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  frame = " +-------+-------+-------+ "
  grid(board).each_with_index do |row, row_index|
    puts frame if row_index%3 == 0
    row.each_with_index do |space, space_index|
      print (space_index%3 == 0) ? " | " : " "
      print space == 0 ? "_" : space
      puts " |\n" if space_index%9 == 8
    end
  end
  puts frame
end
