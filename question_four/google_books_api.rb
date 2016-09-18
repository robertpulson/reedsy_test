require './query.rb'

puts 'Hi Reedsy. What would you like to search for?'
q = Query.new(gets.chomp)
if q.success
  puts q.output
else
  puts 'This program encountered the following error:'
  puts q.error
  puts 'Please check your connection and try again'
end
