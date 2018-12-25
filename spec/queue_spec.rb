# frozen_string_literal: true

require "queue"

describe Queue do
  it "can peek at the front of the queue" do
    s = Queue.new
    s.add(1)
    expect(s.peek).to eq(1)
  end

  it "can add to the queue" do
    s = Queue.new
    s.add(1)
    expect(s.empty?).to be false
  end

  it "can remove from the queue" do
    s = Queue.new
    s.add(1)
    expect(s.remove).to eq(1)
  end
end

