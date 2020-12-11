# my_min
# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list.
#  Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

require "byebug"
# n^2
# def my_min(arr)
    
#         arr.each_with_index do |num1,i1|
#             small = true
            
#             arr.each_with_index do |num2,i2|
#                 if num2 < num1 
#                     small = false
#                 end
#             end
#             return num1 if small
#         end
    
# end
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)



# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

#O(n)

# def my_min(arr)
#     min = arr[0]
#     arr.each do |num|
#         if num < min
#             min = num
#         end
#     end
#     min

# end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

#O(2^n) b/c lookng at subsets

def largest_contiguous_subsum(arr)
    subs = []
    l = arr.length
    (0...l).each do |i|
        (0...l).each do |j|   
            subs << arr[i..j] if arr[i..j].length > 0
        end
    end
    subs.map(&:sum).max
end


list1 = [5, 3, -7]
p largest_contiguous_subsum(list1) # => 8


list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

<<<<<<< HEAD

=======
list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])
>>>>>>> 81178dd65a818bdc59bdc14fff3fb65a78fc26c3
