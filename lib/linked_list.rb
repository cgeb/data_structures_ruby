# frozen_string_literal: true

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

    data = @head
    @head = @head.next
    @tail = nil unless @head
    data&.value
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
      data = @head
      @head = nil
      @tail = nil
      return data&.value
    end
    curr = @head
    curr = curr.next while curr.next != @tail
    data = curr.next
    curr.next = nil
    @tail = curr
    data&.value
  end

  def add_at_index(index, value)
    raise OutOfBoundsError if !index.is_a?(Integer) || index.negative?

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
    raise OutOfBoundsError if !index.is_a?(Integer) || index.negative?

    return remove_from_front if index.zero?

    curr = @head
    (index - 1).times do
      raise OutOfBoundsError unless curr.next

      curr = curr.next
    end

    data = curr.next
    if curr.next.next
      curr.next = curr.next.next
    else
      @tail = curr
      @tail.next = nil
    end
    data&.value
  end
end

class OutOfBoundsError < StandardError; end
