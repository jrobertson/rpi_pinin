#!/usr/bin/env ruby

# file: rpi_pinin.rb



class RPiPinIn
  
  def initialize(id)
    
    @id = id
    unexport()
    
    File.write '/sys/class/gpio/export', id
    File.write "/sys/class/gpio/gpio#{id}/direction", 'out'
    File.write "/sys/class/gpio/gpio#{id}/direction", 'high'
    
    at_exit {   unexport() }
    
  end

  # override this method if you wish
  #
  def on_change(value)
    
  end
  
  # override this method if you wish
  #
  def on_high()
    
  end  
  
  def watch_high()
    
    watch() do |value|
      
      if value == 1 then
        
        yield if block_given?
        on_high()
        
      end
      
    end
    
  end

  def watch()
    
    old_value = read_value()

    loop do
      
      value = read_value()
      
      if value != old_value then
        
        yield(value) if block_given?
        on_change(value)
        
      end
      
      old_value = value
    end
    
  end
  
  
  def to_s()
    @id
  end
  
  private
  
  def read_value()
    File.read("/sys/class/gpio/gpio#{@id}/value").chomp  == '0' ? 1 : 0
  end
  
  # to avoid "Device or resource busy @ fptr_finalize - /sys/class/gpio/export"
  # we unexport the pins we used
  #
  def unexport()
    
    return unless File.exists? '/sys/class/gpio/gpio' + @id.to_s

    File.write "/sys/class/gpio/unexport", @id
  end
end