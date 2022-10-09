# Command Interface
class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def undo
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

  def undo
    light.off
  end

  private

  attr_reader :light
end

# Class: LightOffCommand
class LightOffCommand < Command
  def initialize(light)
    @light = light

    freeze
  end

  def execute
    light.off
  end

  def undo
    light.on
  end

  private

  attr_reader :light
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

  def undo
    garage_door.close
  end

  private

  attr_reader :garage_door
end

# Class: GarageDoorCloseCommand
class GarageDoorCloseCommand < Command
  def initialize(garage_door)
    @garage_door = garage_door

    freeze
  end

  def execute
    garage_door.close
  end

  def undo
    garage_door.open
  end

  private

  attr_reader :garage_door
end

# Class: NoCommand
class NoCommand < Command
  def execute
    '리모콘에 아무 설정이 되어있지 않습니다'
  end
end

# Class: SimpleRemoteControl
# TODO: 7을 넘어갈 때 어떻게 처리해줄지 생각해야함
class RemoteControl
  attr_accessor :on_commands, :off_commands, :undo_command

  # undo_command로 freeze가 안됨
  def initialize
    @on_commands = set_no_commands
    @off_commands = set_no_commands
    @undo_command = NoCommand.new
  end

  def print
    on_commands.each { |command| p command.on_button_was_pressed }
    off_commands.each { |command| p command.off_button_was_pressed }
  end

  def set_command(slot, on_command, off_command)
    on_commands[slot] = on_command
    off_commands[slot] = off_command
  end

  def on_button_was_pressed(button_number)
    p on_commands[button_number].execute
    @undo_command = on_commands[button_number]
  end

  def off_button_was_pressed(button_number)
    p off_commands[button_number].execute
    @undo_command = off_commands[button_number]
  end

  def undo_button_was_pushed
    p undo_command.undo
  end

  private

  def set_no_commands
    Array.new(7, NoCommand.new)
  end
end

