require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

board = File.readlines('sudoku_puzzles.txt').first.chomp
  
instructions = ""
instructions += "Sudoku\n"
(instructions.length - 1).times {instructions += "*"}
instructions += "\n"
instructions += "Board:\n"
puts instructions
puts pretty_board(board)
puts "rows are #{rows(grid(board))}"
puts "columns are #{columns(grid(board))}"
puts "boxes are #{boxes(grid(board))}"
puts "\n\n"

solved_board = solve(board)
  if solved?(solved_board)
    puts "The board was solved!"
    puts pretty_board(solved_board)
  else
    puts "The board wasn't solved :("
    puts pretty_board(solved_board)
  end
  