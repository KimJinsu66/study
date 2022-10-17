# frozen_string_literal: true

# Class: MenuOrderIterator
class MenuOrderIterator
  include Enumerable

  def initialize(collection, reverse: false)
    @collection = collection
    @reverse = reverse
  end

  def each(&block)
    return @collection.reverse.each(&block) if reverse

    @collection.each(&block)
  end

  private

  attr_accessor :reverse, :collection
end

# Class: MenuCollection
class MenuCollection
  def initialize(collection = [])
    @collection = collection
  end def iterator
    MenuOrderIterator.new(@collection)
  end

  def reverse_iterator
    MenuOrderIterator.new(@collection, true)
  end

  def add_item(item)
    @collection << item
  end

  private

  attr_accessor :collection
end

# main =============================================================

collection = MenuCollection.new
collection.add_item('rice')
collection.add_item('undon')
collection.add_item('ramen')

puts 'Straight traversal:'
collection.iterator.each { |item| puts item }
puts "\n"

puts 'Reverse traversal:'
collection.reverse_iterator.each { |item| puts item }
