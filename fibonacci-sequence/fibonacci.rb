def iterative_nth_fibonacci_number(n)
  # Set first two terms of fibonacci sequence (so we don't need to do math on them later)
  fib_array = [0,1]

  # Create for loop to execute each element in expression
  for i in (0..n)
  	fib_array[i] =
  	  if i < 2 # If i indicates one of the first two terms in sequence,
  	  	i 	   # just print it (no need to do math)
  	  else
  	  	fib_array[i-1] + fib_array[i-2] # If we're dealing with third term or after,
  	  end								# calculate it by adding two previous terms in sequence
  end
  fib_array[n]
end

def recursive_nth_fibonacci_number(n)
  if n < 2 # Base case
  	n
  else
  	recursive_nth_fibonacci_number(n-1) + recursive_nth_fibonacci_number(n-2) # Moving toward n < 2
  end
end
