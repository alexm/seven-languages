#!/usr/bin/env ruby

numbers = (1..16).to_a
puts numbers.join(" ")

puts
i = 0
numbers.each do |n|
  print n
  print i % 4 == 3 ? "\n" : " "
  i += 1
end

puts
numbers.each_slice(4) { |a| print a.join(" "), "\n" }
