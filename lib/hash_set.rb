# frozen_string_literal: true

require File.expand_path("linked_list", __dir__)

class HashSet
  LOAD_FACTOR = 0.75

  def initialize
    @buckets = Array.new(10) { LinkedList.new }
    @current_size = 0
  end

  def add(value)
    return false if contains?(value)

    bucket = value.hash % @buckets.length
    @buckets[bucket].add_to_front(value)
    @current_size += 1

    resize_all if @current_size.to_f / @buckets.length > LOAD_FACTOR
    true
  end

  def contains?(value)
    bucket = value.hash % @buckets.length
    @buckets[bucket].contains?(value)
  end

  private

  def resize_all
    old_buckets = @buckets
    @buckets = Array.new(@buckets.length * 2) { LinkedList.new }
    old_buckets.each do |bucket|
      bucket.each do |value|
        new_bucket = value.hash % @buckets.length
        @buckets[new_bucket].add_to_front(value)
      end
    end
  end
end
