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
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)



# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

#O(n)

def my_min(arr)
    min = arr[0]
    arr.each do |num|
        if num < min
            min = num
        end
    end
    min

end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

#O(n^3) b/c lookng at subsets

def largest_contiguous_subsum(arr)
    subs = []
    l = arr.length
    (0...l).each do |i|
        (0...l).each do |j|   
            subs << arr[i..j] if arr[i..j].length > 0 # n*n *(  n)  == n^3 + n
        end
    end
    subs.map(&:sum).max
end


# list1 = [5, 3, -7]
# p largest_contiguous_subsum(list1) # => 8


# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])



# list3 = [-5, -1, -3]
# p largest_contiguous_subsum(list3) # => -1 (from [-1])

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
#  Keep a running tally of the largest sum. To accomplish this efficient space complexity, 
#  consider using two variables. One variable should track the largest sum so far and another to 
#  track the current sum. We'll leave the rest to you.

## o(n)- linear
def largest_contiguous_subsum(arr)
        
    curr_sum = arr.first
    largest_sum = arr.first
    (1...arr.length).each do |i|  
        if curr_sum < 0
            curr_sum = 0 #reset
        end

        curr_sum += arr[i] 
        
        if curr_sum > largest_sum 
            largest_sum = curr_sum
        end
    end
     largest_sum
end


list1 = [5, 3, -7]
p largest_contiguous_subsum(list1) # => 8


list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])



list3 = [-5, -1, -3]
p largest_contiguous_subsum(list3) # => -1 (from [-1])


                      #ary: [1, 2, -4, 4, -3, 4]

# largest_contiguous_subsum [ 1 ,3 ,3, 4 ,4, 5 ]
#        contiguious_subsum [1,  3, 0, 4, 1 ,5]
