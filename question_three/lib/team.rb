class Team
  Member = Struct.new(:name)
  # declare a constant to use as a heading and freeze it so its value is immutable
  HEADING = 'Members:'.freeze
  # declare a constant to store the suffixes (should be frozen, howvever rspec needs to stub its output)
  SUFFIXES = %w(ish oosh son ick op)

  # used only for testing purposes
  attr_reader :members

  def initialize
    @members = []
  end

  def <<(name)
    @members << Member.new(name)
  end

  def members_names
    @members.map(&:name)
  end

  def pro_names(limit = 10)
    members_names.map(&:capitalize).take(limit)
  end

  def reverse_names
    members_names.reverse.map(&:downcase).map(&:reverse)
  end

  def present_names(options = { shuffle: false, sort: false, reverse: false })
    names = members_names
    names = names.shuffle if options[:shuffle]
    names = names.reverse if options[:reverse]
    names = names.sort    if options[:sort]
    names.map { |n| "* #{n}" }.unshift(HEADING)
  end

  def funny_names
    members_names.map { |name| name.split(' ').map { |word| word + random_suffix }.join(' ') }
  end

  private

  def random_suffix
    SUFFIXES.sample
  end
end

# the methods inside the class now deliberately only return arrays of strings
# the original methods which were outputing the strings could have been left in
# however it is desireable to call the classes method to return the array data
# from a controller/boundary class and then output it, the class should have no direct
# interaction with the terminal/output. The name arrays could be printed as follows

# t = Team.new
# puts t.pro_names(3)
# puts t.reverse_names
# puts t.presentation_names({ shuffle: true })
# puts t.funny_names
