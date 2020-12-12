# Max Windowed Range
# Given an array, and a window size w, find the maximum range (max - min) within a set of w elements.

# Let's say we are given the array [1, 2, 3, 5] and a window size of 3. Here, there are only two cases to consider:

# 1. [1 2 3] 5
# 2. 1 [2 3 5]
# In the first case, the difference between the max and min elements of the window is two (3 - 1 == 2). In the second case, that difference is three (5 - 2 == 3). We want to write a function that will return the larger of these two differences.

# Phase 1: Naive Solution
# One approach to solving this problem would be:

# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. For each window:
# Find the min value in the window.
# Find the max value in the window.
# Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
# Return current_max_range.
# Implement this approach in a method, windowed_max_range(array, window_size). Make sure your code passes the following test cases:

#overall time complexity: O(n^2))
def windowed_max_range(arr, window_size)
    current_max_range = nil
    arr.each_with_index do |el, i|

        sub_arr = arr[i...i+window_size]
        diff = sub_arr.max - sub_arr.min
        if !current_max_range || current_max_range < diff
            current_max_range = diff

        end
    end
    current_max_range
end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


# #Phase 2: Queue

class MyQueue
    def initialize
      @store = []
    end

    def peek #returns the "top" or "next" item without actually removing it
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(ele) #adds an element to the back of the queue
        @store.push(ele)
    end

    def dequeue #removes an element from the front of the queue and returns it
        @store.shift
    end
  end

#   q = MyQueue.new 
#   p q.size
#   p q.enqueue("ele")
class MyStack
    def initialize
        @store =[]
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(ele)
        @store.push(ele)
    end

end

class StackQueue < MyStack
    super
    
end