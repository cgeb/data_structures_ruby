require File.expand_path("linked_list", __dir__)

# Queue is a FIFO data structure
class Queue
  def initialize
    @list = LinkedList.new
  end

  def peek
    @list.tail&.value
  end

  def add(value)
    @list.add_to_back(value)
  end

  def remove
    @list.remove_from_back
  end

  def empty?
    @list.head.nil?
  end
end
