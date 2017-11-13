# Write a program that asks the user whether they want the program to print
# "something", then print it if the user enters y. Otherwise, print nothing.
#
# Examples:
#
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# y
# something
#
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# n
#
# $ ruby something.rb
# >> Do you want me to print something? (y/n)
# help

=begin

Input: Input from user
Output: String or nothing

Rules:
- print string or nothing depending on user input

Algorithm:
- Ask user for input
- Initialize variable and assign to users input
- Print string if user input is y
- Do nothing if input not y

=end

puts "Do you want me to print something? (y/n)"
answer = gets.chomp
puts "Something" if answer.downcase == "y"
