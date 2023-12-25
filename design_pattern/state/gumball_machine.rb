
class GumballMachine
  def initialize
    @count = 0
  end

end

# Interface State
class State
  def insert_quarter
    raise NotImplementedError
  end

  def eject_quarter
    raise NotImplementedError
  end

  def turn_crank
    raise NotImplementedError
  end

  def dispense
    raise NotImplementedError
  end
end

class NoQuarterState < State
  def initialize(gumball_machine)
    @gumball_machine = gumball_machine

    freeze
  end

  def insert_quarter
    p "동전을 넣으셨습니다"
    gumball_machine.set_state(gumball_machine.has_quarter_state)
  end

  def eject_quarter
    p '동전을 넣어주세요'
  end

  def turn_crank
    p '동전을 넣어주세요'
  end

  def dispense
    p '동전을 넣어주세요'
  end

  private

  attr_reader :gumball_machine
end

class HasQuarterState < State
  def insert_quarter
  end

  def eject_quarter
  end

  def turn_crank
  end

  def dispense
  end

end

class SoldState < State
  def insert_quarter
  end

  def eject_quarter
  end

  def turn_crank
  end

  def dispense
  end

end

class SoldOutState < State
  def insert_quarter
  end

  def eject_quarter
  end

  def turn_crank
  end

  def dispense
  end

end

class WinnerState < State
  def insert_quarter
  end

  def eject_quarter
  end

  def turn_crank
  end

  def dispense
  end
end
