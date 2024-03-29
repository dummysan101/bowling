require "framestatus.rb"

class FrameInfo
  attr_reader :status
  attr_reader :score
  
  def initialize
    @frame = 0
    @status = FrameStatus::None
    @pin = Array.new
    @score = 0
  end
  
public
  def set_data(frame, pin)
    @frame = frame
    @pin = pin
    @score = @pin.inject{|sum, x| sum += x }
    
    set_status
  end
  
  def bonus(point)
    @score += point
  end
  
  #
  # 1投目に倒したピン数を取得する.
  #
  def bowl1
    return ( 0 < @pin.size ) ? @pin[0] : 0
  end
  
  #
  # 2投目に倒したピン数を取得する.
  # (2投目を投げていない場合は0)
  #
  def bowl2
    return ( 1 < @pin.size ) ? @pin[1] : 0
  end
  
private
  def set_status
    begin
      if @pin[0] == 10
        @status = FrameStatus::Strike
      elsif @pin[0] + @pin[1] == 10
        @status = FrameStatus::Spare
      else
        @status = FrameStatus::OpenFrame
      end
    rescue
      @status = FrameStatus::None
    end
  end
end
