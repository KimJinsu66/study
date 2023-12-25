# Singletonは、Mix-inしたクラスのinstanceは同一のインスタンスを返すようになる
require 'singleton'

class SingletonObject
  # instanceメソッドが定義され、newメソッドがprivateに設定される
  include Singleton
  attr_accessor :counter

  def initialize
    @counter = 0
  end
end

obj1 = SingletonObject.instance
obj1.counter += 1
p obj1.counter # 1

obj2 = SingletonObject.instance
obj2.counter += 1
p obj2.counter # 2
