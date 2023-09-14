
class Anglophone < Speaker
  def test
    p 'hello'
  end

  def speak
    p "hello"
  end
end

Anglophone.new('Jack').speak
