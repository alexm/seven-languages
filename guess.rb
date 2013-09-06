#!/usr/bin/env ruby

puts "Guess the secret number between 0 and 100?"

secret = rand(101)
guess  = -1

while guess != secret
  guess = readline.to_i
  if guess < secret
    puts "more"
  elsif guess > secret
    puts "less"
  end
end

puts "You did it!"
