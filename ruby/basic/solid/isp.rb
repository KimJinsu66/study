module Createable
  def create
     raise NotImplementedError
  end
end

module Deleteable
  def delete
     raise NotImplementedError
  end
end

class Contract
  include Createable

  def initialize(object)
    @object = object

    freeze
  end

  def create
    '契約Timeline作成'
  end
end

class User
  include Createable
  include Deleteable

  def initialize(object)
    @object = object

    freeze
  end

  def create
    'ユーザーTimeline作成'
  end

  def delete
    'ユーザーTimeline削除'
  end
end

p Contract.new({}).create
p User.new({}).create
p User.new({}).delete
