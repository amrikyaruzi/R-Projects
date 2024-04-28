# Monte Carlo Simulation for Average number of Consecutive Heads when a coin is flipped 100 times

# replications = 100000
# runs (coin tosses in each run) = 100

tictoc::tic()

mean(replicate(100000000, max(rle(rbinom(100, 1, prob = 0.5))$lengths)))

tictoc::toc()
