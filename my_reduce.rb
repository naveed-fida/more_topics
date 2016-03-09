class Array
  def my_reduce(accumulator = 0)
    counter = 0

    while counter < size
      accumulator = yield(accumulator, self[counter])
      counter += 1
    end

    accumulator
  end
end


puts [1, 2, 3].my_reduce { |acc, num| acc + num}

puts([1, 2, 3].my_reduce(10) do |acc, num|
  acc + num
end)