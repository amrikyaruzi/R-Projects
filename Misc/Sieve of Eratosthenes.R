# Initialize an empty list to store prime numbers
primes <- c()

# Set the maximum number to check for prime
max_num <- 1000000

# Create a vector of all integers from 2 to max_num
numbers <- 2:max_num

# Initialize the current prime number to 2
current_prime <- 2

# Iterate until we have found the 10001st prime number
while (length(primes) < 10001) {
  
  # Add the current prime number to the list of prime numbers
  primes <- c(primes, current_prime)
  
  # Remove all multiples of the current prime number from the list of numbers
  numbers <- numbers[numbers %% current_prime != 0]
  
  # Update the current prime number to the next number in the list
  current_prime <- min(numbers)
}

# Print the 10001st prime number
print(primes[10001])
