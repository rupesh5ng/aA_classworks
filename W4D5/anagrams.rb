# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of
#  the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of 
# the strings?
#O(n)
# def first_anagram?(string1,string2)
#   new_strings =  string1.chars.permutation.to_a
#   new_strings.include?(string2.chars)

# end
# p first_anagram?("cat", "tac")
# p first_anagram?("string","trisng")
# # p first_anagram?()


# Phase II:
# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an 
# index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? 
# and #second_anagram??

def second_anagram?(string1,string2)
  string1.each_char.with_index do |char, i|
    idx = string2.index(char)
    if idx != nil 
      string2 = string2[0...idx] + string2[idx+1..-1]
    end
  end
  string2.length == 0
end

p second_anagram?("cat", "tac")
p second_anagram?("string","trisng")
p second_anagram?("string","house")

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??
