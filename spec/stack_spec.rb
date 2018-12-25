# frozen_string_literal: true

require "stack"

describe Stack do
  it "can peek at the front of the stack" do
    s = Stack.new
    s.push(1)
    expect(s.peek).to eq(1)
  end

  it "can push to the stack" do
    s = Stack.new
    s.push(1)
    expect(s.empty?).to be false
  end

  it "can pop from the stack" do
    s = Stack.new
    s.push(1)
    expect(s.pop).to eq(1)
  end
end
