# The following methods will help us
# update the screen when printing the board
def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the screen
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal back to the upper left
def move_to_home
  print "\e[H"
end
