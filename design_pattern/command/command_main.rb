#
# frozen_string_literal: true

require './command'

remote = SimpleRemoteControl.new
light = Light.new

light_on = LightOnCommand.new(light)
light_off = LightOffCommand.new(light)

remote.change_slot = light_on
remote.button_was_pressed

remote.change_slot = light_off
remote.button_was_pressed

garage_door = GarageDoor.new
garage_door_open_command = GarageDoorOpenCommand.new(garage_door)

remote.change_slot = garage_door_open_command
remote.button_was_pressed
