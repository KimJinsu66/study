class Stack
  attr_reader :data
  
  def initialize
    @data = []
  end

  def push(element)
    data << element
  end

  def pop
    data.pop
  end

  def read
    data.last
  end
end

stack = Stack.new

stack.push(1)
p stack.read

stack.push(2)
stack.push(3)
p stack.read

stack.pop
p stack.read
