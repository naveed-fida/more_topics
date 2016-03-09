class Array
  def my_select
    return self.to_enum if !block_given?
    counter = 0
    arr = []

    while counter < size
      arr << self[counter] if yield(self[counter])
      counter += 1
    end

    arr
  end
end

array = [1, 2, 3, 4]

puts array.my_select
puts ''
puts array.my_select {|x| x > 1}