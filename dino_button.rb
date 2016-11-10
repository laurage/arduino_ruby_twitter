#
# This is an example of how to use the button class
# You must register helpers and have the main thread
# sleep or in someway keep running or your program
# will exit before any callbacks can be called
#
require 'bundler/setup'
require 'dino'

light = true

board = Dino::Board.new(Dino::TxRx::Serial.new)
button = Dino::Components::Button.new(pin: 2, board: board)
led = Dino::Components::Led.new(pin: 13, board: board)

button.down do
  puts "button up"
  light = true
end

button.up do
  puts "button down"
  light = false
end

sleep

if(light==true)
  led.send(:on)
else
  led.send(:off)
end

