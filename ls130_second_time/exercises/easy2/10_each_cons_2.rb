# In the previous exercise, we wrote a method that emulates Enumerable#each_cons,
# but limited our method to handling 2 elements at a time. Enumerable#each_cons
# can actually handle any number of elements at a time: 1, 2, 3, or more.

# Update your each_cons method so it takes an argument that specifies how many
# elements should be processed at a time.

# Your method may use #each, #each_index, #each_with_object, #inject, loop, for,
# while, or until to iterate through the Array passed in as an argument, but must
# not use any other methods that iterate through an Array or any other collection.

=begin

input: array, integer
output: nil

rules:
- yield n values to the block
- return nil

algorithm:
- use each with index to iterate through the array
- yield an array slice of arr[0], n and increment until the last slice
- break if index == arr.size - 3

=end

def each_cons(arr, count)
  arr.each_with_index do |_, index|
    break if index >= arr.size - (count - 1)
    yield(*arr[index, count])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}