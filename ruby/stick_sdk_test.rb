# frozen_string_literal: true

require './stick_sdk'

if STICK.init_sdk.zero?
  puts 'failed to init SDK'
  exit 1
end

STICK.stop_led_demo

STICK.write_line(0, ([1,0,0] * 32).pack('C*'))
STICK.write_line(1, ([0,1,0] * 32).pack('C*'))
STICK.write_line(2, ([0,0,1] * 32).pack('C*'))
STICK.write_line(3, ([1,1,0] * 32).pack('C*'))
STICK.write_line(4, ([0,1,1] * 32).pack('C*'))
STICK.write_line(5, ([1,0,1] * 32).pack('C*'))

loop do
  6.times do |line|
    STICK.show_line(line)
    sleep(1)
  end
end