# Command Interface
class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Class: Light
class Light
  def on
    'turn on the light'
  end

  def off
    'turn off the light'
  end
end

# Class: LightOnCommand
class LightOnCommand < Command
  def initialize(light)
    @light = light

    freeze
  end

  def execute
    light.on
  end

  private

  attr_reader :light
end

# Calss: LightOffCommand
class LightOffCommand < Command
  def initialize(light)
    @light = light

    freeze
  end

  def execute
    light.off
  end

  private

  attr_reader :light
end

# Class: SimpleRemoteControl
class SimpleRemoteControl
  attr_accessor :slot

  def initialize
    @slot = nil
  end

  def change_slot=(command)
    @slot = command
  end

  def button_was_pressed
    p slot.execute
  end
end

# Class: GarageDoor
class GarageDoor
  def open
    'open the garage door'
  end

  def close
    'close the garage door'
  end
end

# Class: GarageDoorOpenCommand
class GarageDoorOpenCommand < Command
  def initialize(garage_door)
    @garage_door = garage_door

    freeze
  end

  def execute
    garage_door.open
  end

  private

  attr_reader :garage_door
end
