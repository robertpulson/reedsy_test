require './query.rb'

puts 'Hi Reedsy. What would you like to search for?'
q = Query.new(gets.chomp)
if q.success
  puts q.output
else
  puts 'Your search could not be completed.'
  puts 'please make sure you have an internet connection and try again.'
end
