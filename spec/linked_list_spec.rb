# frozen_string_literal: true

require "linked_list"

describe LinkedList do
  it "can add to front of list" do
    ll = LinkedList.new
    ll.add_to_front(1)
    expect(ll.head.value).to eq(1)
    expect(ll.tail.value).to eq(1)
    ll.add_to_front(2)
    expect(ll.head.value).to eq(2)
    expect(ll.tail.value).to eq(1)
  end

  it "can remove from front of list" do
    ll = LinkedList.new
    ll.add_to_front(1)
    ll.add_to_front(2)
    data = ll.remove_from_front
    expect(ll.head.value).to eq(1)
    expect(ll.tail.value).to eq(1)
    expect(data).to eq(2)
    data = ll.remove_from_front
    expect(ll.head).to be_nil
    expect(ll.tail).to be_nil
    expect(data).to eq(1)
  end

  it "can add to back of list" do
    ll = LinkedList.new
    ll.add_to_back(1)
    expect(ll.head.value).to eq(1)
    expect(ll.tail.value).to eq(1)
    ll.add_to_back(2)
    expect(ll.head.value).to eq(1)
    expect(ll.tail.value).to eq(2)
  end

  it "can remove from back of list" do
    ll = LinkedList.new
    ll.add_to_back(1)
    ll.add_to_back(2)
    data = ll.remove_from_back
    expect(ll.head.value).to eq(1)
    expect(ll.tail.value).to eq(1)
    expect(data).to eq(2)
    data = ll.remove_from_back
    expect(ll.head).to be_nil
    expect(ll.tail).to be_nil
    expect(data).to eq(1)
  end

  it "can add at a specified index" do
    ll = LinkedList.new
    ll.add_at_index(0, "a")
    expect(ll.head.value).to eq("a")
    expect(ll.tail.value).to eq("a")
    ll.add_at_index(1, "b")
    ll.add_at_index(2, "c")
    ll.add_at_index(3, "d")
    expect(ll.head.value).to eq("a")
    expect(ll.tail.value).to eq("d")
  end

  it "raises errors if specified index for add does not exist" do
    ll = LinkedList.new
    expect { ll.add_at_index(1, "a") }.to raise_error(OutOfBoundsError)
    ll.add_at_index(0, "b")
    ll.add_at_index(1, "c")
    ll.add_at_index(2, "d")
    expect { ll.add_at_index(-1, "a") }.to raise_error(OutOfBoundsError)
    expect { ll.add_at_index("a", "a") }.to raise_error(OutOfBoundsError)
    expect { ll.add_at_index(10, "a") }.to raise_error(OutOfBoundsError)
  end

  it "can remove at a specified index" do
    ll = LinkedList.new
    ll.add_to_front(1)
    ll.add_to_front(2)
    ll.add_to_front(3)
    ll.add_to_front(4)
    ll.add_to_front(5)
    ll.remove_at_index(3)
    ll.remove_at_index(2)
    data = ll.remove_at_index(1)
    expect(ll.head.value).to eq(5)
    expect(ll.tail.value).to eq(1)
    expect(data).to eq(4)
    data = ll.remove_at_index(1)
    expect(ll.head.value).to eq(5)
    expect(ll.tail.value).to eq(5)
    expect(data).to eq(1)
    data = ll.remove_at_index(0)
    expect(ll.head).to be_nil
    expect(ll.tail).to be_nil
    expect(data).to eq(5)
  end

  it "raises errors if specified index for remove does not exist" do
    ll = LinkedList.new
    expect { ll.add_at_index(1, "a") }.to raise_error(OutOfBoundsError)
    ll.add_at_index(0, "b")
    ll.add_at_index(1, "c")
    ll.add_at_index(2, "d")
    expect { ll.add_at_index(-1, "a") }.to raise_error(OutOfBoundsError)
    expect { ll.add_at_index("a", "a") }.to raise_error(OutOfBoundsError)
    expect { ll.add_at_index(10, "a") }.to raise_error(OutOfBoundsError)
  end
end
