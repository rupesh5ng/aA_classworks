class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max)# { Hash.new } #{|h, k| h[k] = false}
  end

  def insert(num)
    raise "Out of bounds" if !num.between?(0, @max) #num > @max || num < 0
    @store[num] = true

  end

  def remove(num)
    @store = @store[0...num] + @store[num+1..-1]

  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :num_buckets
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end
  def [](pos)
    # row,col = pos
    @store[pos]
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num

  end

  def remove(num)
    i = num % @num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    @store.include?([num])
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self[num] = @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :num_buckets



  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.length 
    i = num % @num_buckets
    if @store.count([num]) == 0
      @store[i] << num
      @count += 1
    end
  end

  def remove(num)
    if @store.count([num]) > 0
      @store.delete([num])
      @count -= 1
    end
  end

  def include?(num)
    if @store.count([num]) >= 1
      return true
    else
      return false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(@num_buckets * 2) {Array.new} 
    @num_buckets = @num_buckets * 2
    old_store.flatten.each do |ele|
      self.insert(ele)
    end
  end
end
