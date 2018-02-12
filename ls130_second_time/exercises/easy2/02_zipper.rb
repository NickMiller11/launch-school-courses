# The Array#zip method takes two arrays, and combines them into a single
# array in which each element is a two-element array where the first element
# is a value from one array, and the second element is a value from the
# second array, in order. For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation.
# It should take two Arrays as arguments, and return a new Array
# (the original Arrays should not be changed). Do not use the built-in
# Array#zip method. You may assume that both input arrays have the
# same number of elements.

=begin

input: 2 arrays
output: an array of nested arrays

rules:
- return an array that contains nested sub-arrays that contain the values from
  each input array at the same index position

algorithm:
- instantiate a new Array
- use #each_with_index to iterate through the first array
- use the index value to reference the element in the second array
- push both values inside of an array to the new array
- return new array

=end



def zip(arr1, arr2)
  zipped = Array.new
  arr1.each_with_index { |el, idx| zipped << [el, arr2[idx]] }
  zipped
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]