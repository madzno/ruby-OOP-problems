class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def current_switch_state
    puts "Currently the switch is #{switch}"
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end

end

light = Machine.new
light.start
light.current_switch_state
light.stop
light.current_switch_state
