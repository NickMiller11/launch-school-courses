# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# What output does this code print? 
# Fix this class so that there are no surprises waiting in 
# store for the unsuspecting developer.

=begin

This will print:
FLUFFY
My name is FLUFFY
FLUFFY
Fluffy

=end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name