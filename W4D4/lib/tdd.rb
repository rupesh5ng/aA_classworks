def my_uniq(arr)
    return arr if arr.length <= 1
    arr.uniq
end

class Array
    def two_sum
        pairs = []
        (0...self.length - 1).each do |i|
            (i+1...self.length).each do |j|
                pairs << [i,j] if (self[i] + self[j]) == 0
            end
        end

        return nil if pairs.empty?
        pairs
    end

end
# arr = %w(-1 0 2 -2 1)
# p arr
# p arr.two_sum

def my_transpose(matrix)
    l = matrix.length
    new_matrix = Array.new(l) {Array.new(l)}
    (0...l).each do |i|
        (0...l).each do |j|
            new_matrix[i][j] = matrix[j][i]
        end
    end
    new_matrix
end

