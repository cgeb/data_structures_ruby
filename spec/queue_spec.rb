# frozen_string_literal: true

require "queue"

describe Queue do
  it "can peek at the front of the queue" do
    q = Queue.new
    q.add(1)
    expect(q.peek).to eq(1)
  end

  it "can add to the queue" do
    q = Queue.new
    q.add(1)
    expect(q.empty?).to be false
  end

  it "can remove from the queue" do
    q = Queue.new
    q.add(1)
    expect(q.remove).to eq(1)
  end
end

