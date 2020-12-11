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

# def stock_picker(stock_prices)
#     l = stock_prices.length
#     (0...l).each do |i|
#         (i + 1...l).each do |j|
#             pair = [i, j]
#             max = stock_prices[j] - stock_prices[i]
#             if max < stock_prices[j] - stock_prices[i]
#                 pair = [i, j]
#                 max = stock_prices[j] - stock_prices[i]
#             end
#         end
#     end
# end

def stock_picker(stock_prices)
#O(n) way
    # default day 0 to buy, day 1 to sell
    #track buy first, if its not less than buy, then check sell
    #if day_profit is more than our current profit winner, reset sell
    buy = 0
    sell = 1
    profit = stock_prices[1] - stock_prices[0]
    pair = [buy, sell]
    (1...stock_prices.length).each do |day|
        day_profit = stock_prices[day] - stock_prices[buy]
        if stock_prices[day] < stock_prices[buy]
            buy = day
        elsif day_profit > profit
            sell = day
            profit = day_profit 
            pair = [buy, sell]
        end
    end
    pair
end

def tower_of_hanoi(n)
    tower = Array.new(3) {Array.new}
    tower[0] = [*1..n].reverse
    render
end

def move(x, y)
    if valid_move?(x, y)
        move
    else
        p ''
        x, y = gets.chomp.split
        move(x,y)
    end
end

def valid_move?(x, y)
    from = x
    to = y
    if x.between?(0, 2) && y.between?(0, 2)
        if arr[x].last < arr[y].last
            true
        end
    end
    false
end

def render

end

def won?
    if (arr[0].empty? && arr[1].empty?) || 
        (arr[0].empty? && arr[2].empty?)
        true
    end
    false
end
