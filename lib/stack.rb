require File.expand_path("linked_list", __dir__)

# Stack is a LIFO data structure
class Stack
  def initialize
    @list = LinkedList.new
  end

  def peek
    @list.head&.value
  end

  def push(value)
    @list.add_to_front(value)
  end

  def pop
    @list.remove_from_front
  end

  def empty?
    @list.head.nil?
  end
end
