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
def my_min(arr)
    
        arr.each_with_index do |num1,i1|
            small = true
            
            arr.each_with_index do |num2,i2|
                if num2 < num1 
                    small = false
                end
            end
            return num1 if small
        end
    
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)



# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum.
#  What is the time complexity?



