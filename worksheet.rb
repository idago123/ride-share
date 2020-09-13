# frozen_string_literal: true

########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# 1. Outer layer - a hash
# Second layer - Arrays
# Third layer - hashes

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
# each layer should be a hash
#
# # 1. Outer layer - a hash - the key is driver id and the value is an array, with each element representing a ride
# # Second layer - Arrays - each element contains info about each ride

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = {
  DR0004: [
    {
      cost: 5,
      rider_id: 'RD0022',
      rating: 5,
      date: 'feb 3 2016'
    },
    {
      cost: 10,
      rider_id: 'RD0022',
      rating: 4,
      date: 'feb 4 2016'
    },
    {
      cost: 20,
      rider_id: 'RD0073',
      rating: 5,
      date: 'Feb 5 2016'
    }
  ],

  DR0001: [
    {
      cost: 10,
      rider_id: 'RD0003',
      rating: 3,
      date: 'Feb 3 2016'
    },
    {
      cost: 30,
      rider_id: 'RD0015',
      rating: 4,
      date: 'Feb 3 2016'
    },
    {
      cost: 45,
      rider_id: 'RD0003',
      rating: 2,
      date: 'Feb 5 2016'
    }
  ],
  DR0002: [
    {
      cost: 25,
      rider_id: 'RD0073',
      rating: 5,
      date: 'Feb 3 2016'
    },
    {
      cost: 15,
      rider_id: 'RD0013',
      rating: 1,
      date: 'Feb 4 2016'
    },
    {
      cost: 35,
      rider_id: 'RD0066',
      rating: 3,
      date: 'Feb 5 2016'
    }
  ],
  DR0003: [
    {
      cost: 5,
      rider_id: 'RD0066',
      rating: 5,
      date: 'Feb 4 2016'
    },
    {
      cost: 50,
      rider_id: 'RD0003',
      rating: 2,
      date: 'Feb 5 2016'
    }
  ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:

puts 'The number of rides each driver has given:'
drivers.each do |driver, rides|
  puts "#{driver} - #{rides.length}"
end

puts 'The total amount of money each driver has made:'
drivers.each do |driver, rides|
  totaldriver = 0
  rides.each do |info|
    totaldriver += info[:cost]
  end
  puts "#{driver} - $#{totaldriver}"
end

puts 'The average rating for each driver:'
drivers.each do |driver, rides|
  totaldriver = 0
  average = 0
  rides.each do |info|
    totaldriver = totaldriver.to_f + info[:rating]
  end
  average = totaldriver / rides.length
  puts "#{driver} - #{average}"
end

puts 'Which driver made the most money?'
drivercost = {}
drivers.each do |driver, rides|
  totaldriver = 0
  rides.each do |info|
    totaldriver += info[:cost]
    drivercost[driver] = totaldriver
  end
end

max_cost = drivercost.max_by { |_driver, cost| cost }
puts "#{max_cost[0]} made the most money with $#{max_cost[1]}"

puts 'Which driver has the highest average rating?'
highest_average = {}
average = 0
drivers.each do |driver, rides|
  totaldriver = 0
  rides.each do |info|
    totaldriver = totaldriver.to_f + info[:rating]
  end
  average = totaldriver / rides.length
  highest_average[driver] = average
end

max_avg = highest_average.max_by { |_driver, avg| avg }
puts "#{max_avg[0]} had the highest average with the rating of #{max_avg[1]}"
