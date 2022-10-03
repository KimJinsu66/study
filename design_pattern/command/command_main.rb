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
