# frozen_string_literal: true

require "hash_set"

describe HashSet do
  describe "contains" do
    before do
      @hm = HashSet.new
      @hm.add("hello")
    end

    it "will return true if contains specified key" do
      expect(@hm.contains?("hello")).to be true
    end
    it "will return false if does not contain specified key" do
      expect(@hm.contains?("world")).to be false
    end
  end

  describe "add" do
    before do
      @hm = HashSet.new
    end

    it "can add to the HashSet" do
      expect(@hm.add("hello")).to be true
    end

    it "will not add if key already exists" do
      @hm.add("hello")
      expect(@hm.add("hello")).to be false
    end

    it "will resize automatically if exceeding load factor" do
      hm = HashSet.new
      words = %w[hello all brand new and exciting marvelous world]
      words.each { |word| hm.add(word) }
      expect(hm.instance_variable_get(:@buckets).length).to eq(20)
    end
  end
end
