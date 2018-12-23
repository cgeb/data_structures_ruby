# Node is a single element of a linked list.
# It holds its own value and a reference to the next node.
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# LinkedList is a linear data structure that holds Nodes
# It holds a reference to the head (first Node in the list)
# Tail holds the last Node (tail is usually optional)
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add_to_front(value)
    new_node = Node.new(value)
    new_node.next = @head
    @tail ||= new_node
    @head = new_node
  end

  def remove_from_front
    return unless @head

    @head = @head.next
    @tail = nil unless @head
  end

  def add_to_back(value)
    new_node = Node.new(value)
    @tail.next = new_node if @tail
    @head ||= new_node
    @tail = new_node
  end

  def remove_from_back
    return unless @head

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end
    curr = @head
    curr = curr.next while curr.next != @tail
    curr.next = nil
    @tail = curr
  end

  def add_at_index(index, value)
    raise OutOfBoundsError if !index.is_a?(Integer) || index < 0

    return add_to_front(value) if index.zero?

    new_node = Node.new(value)
    curr = @head
    raise OutOfBoundsError unless curr

    (index - 1).times do
      raise OutOfBoundsError unless curr

      curr = curr.next
    end
    if curr.next
      new_node.next = curr.next
    else
      @tail = new_node
    end
    curr.next = new_node
  end

  def remove_at_index(index)
    raise OutOfBoundsError if !index.is_a?(Integer) || index < 0
    return remove_from_front if index.zero?

    curr = @head
    (index - 1).times do
      raise OutOfBoundsError unless curr.next

      curr = curr.next
    end

    if curr.next.next
      curr.next = curr.next.next
    else
      @tail = curr
      @tail.next = nil
    end
  end
end

class OutOfBoundsError < StandardError; end
