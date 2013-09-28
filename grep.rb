#!/usr/bin/env ruby

regexp   = Regexp.new(ARGV[0])
filename = ARGV[1]

file = File.open( filename, 'r' )
file.each { |line| puts "#{file.lineno}: #{line}" if regexp =~ line }
