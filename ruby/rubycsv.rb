#!/usr/bin/env ruby

class CsvRow
  def initialize( headers, row )
    @headers = headers
    @row = row
  end
  def method_missing( name, *args )
    @row [ @headers.find_index(name.to_s) ]
  end
end

class ActsAsCsv
  def self.acts_as_csv
    define_method :read do
      file = File.new( self.class.to_s.downcase + '.txt' )
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @result << row.chomp.split(', ')
      end
    end
    define_method :headers do
      @headers
    end
    define_method :csv_contents do
      @result
    end
    define_method :initialize do
      @result = []
      read
    end
    define_method :each do |&block|
      @result.each do |row|
        block.call CsvRow.new( @headers, row )
      end
    end
  end
end

class RubyCsv < ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }
