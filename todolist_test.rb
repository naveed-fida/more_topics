require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
SimpleCov.start

require_relative 'todo'

Minitest::Reporters.use!

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(2, @list.size)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done
    assert_equal(false, @list.done?)
  end

  def test_raises_type_err
    assert_raises(TypeError) do
      @list << 1
    end
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) do
      @list.item_at(5)
    end
  end

  def test_mark_done_at
    assert_raises(IndexError) do
      @list.mark_done_at(4)
    end
    @list.mark_done_at(0)
    assert(@list.item_at(0).done?)
    refute(@list.item_at(1).done?)
  end

  def test_done!
    @list.done!
    assert(@list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(5)
    end
    @list.remove_at(2)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |todo| todo.done! }
    assert(@list.done?)
  end
end