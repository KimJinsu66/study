# frozen_string_literal: true

require './remote_control'

remote_control = RemoteControl.new

light = Light.new

light_on_command = LightOnCommand.new(light)
light_off_command = LightOffCommand.new(light)

garage_door = GarageDoor.new
garage_door_open_command = GarageDoorOpenCommand.new(garage_door)
garage_door_close_command = GarageDoorCloseCommand.new(garage_door)

remote_control.set_command(0, light_on_command, light_off_command)
remote_control.set_command(1, garage_door_open_command, garage_door_close_command)

remote_control.on_button_was_pressed(0)
remote_control.off_button_was_pressed(0)
remote_control.undo_button_was_pushed

p '-------------'

remote_control.on_button_was_pressed(1)
remote_control.off_button_was_pressed(1)
remote_control.undo_button_was_pushed

p '-------------'

remote_control.off_button_was_pressed(2)
remote_control.off_button_was_pressed(6)
