# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers 
# in the array sum to that amount.
#O(n^2)
def bad_two_sum?(arr, target_sum)
    (0...arr.length - 1).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    return false
end

# arr = [0, 1, 5, 7]

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum)
    new_arr = arr.sort
    i = 0
    j = arr.length - 1
    while i < j 
        if (arr[i] + arr[j] ) == target_sum
            return true
        elsif 
            (arr[i] + arr[j] ) > target_sum
            j -= 1
        else
            i += 1
        end
        
        
    end
    false
end
arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => false
# p okay_two_sum?(arr,9) # => false
# p okay_two_sum?(arr, 12) # => true






def hash_map_two_sum(arr,target_sum)
    count = {}
    arr.each do |ele|
        return true if count[target_sum - ele]  
        count[ele] = true
    end
    false
end
arr = [0, 1, 5, 7]
p hash_map_two_sum(arr, 6) # => should be true
p hash_map_two_sum(arr, 10) # => false
p hash_map_two_sum(arr,9) # => false
p hash_map_two_sum(arr, 12) # => true




