# Detecting a button press using the rpi_pinin gem

    require 'rpi_pinin'

    pin = RPiPinIn.new(17, pull: :up)
    pin.watch do |v|

      puts Time.now.to_s + ': ' + v.inspect

    end


In the above example the rpi_pinin gem is used to detect a button press from a momentary push button switch connected between GPIO 17 and ground.

Output:

<pre>
2016-10-17 11:02:26 +0000: 1
2016-10-17 11:02:27 +0000: 0
2016-10-17 11:02:33 +0000: 1
2016-10-17 11:02:34 +0000: 0
</pre>

Notes: 

* The internal pullup resistor was used
* If you don't have a momentary push button switch you can simulate a button press using 2 jumpers (1 to GPIO 17 and the other to ground) which then touch each other momentarily.

## Resources

* rpi_pinin https://rubygems.org/gems/rpi_pinin

## see also

* Introducing the Humble_rpi-plugin-button gem http://www.jamesrobertson.eu/snippets/2015/jun/14/introducing-the-humble_rpi-plugin-button-gem.html

rpi_pinin button rpi raspberrypi
