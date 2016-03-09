require 'pry'
def echo_with_yield(str)
  yield if block_given?
  str
end

def say(words)
  yield if block_given?
  puts "> " + words
end

binding.pry
