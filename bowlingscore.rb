require "framestatus.rb"
require "frameinfo.rb"

class BowlingScore
  def initialize
    @frameList = Array.new
  end
  
  def set_data(frameCount, pin)
    frameInfo = FrameInfo.new
    frameInfo.set_data(frameCount, pin)
    @frameList.push frameInfo
    
    calc_score(frameCount)
  end
  
  def total
    sum = 0
    @frameList.each {|x| sum += x.score }
    return sum
  end
  
private
  def calc_score(frameCount)
    current_frame_index = frameCount - 1
    previous_frame_index = current_frame_index - 1
    before_previous_frame_index = previous_frame_index - 1
    
    current_frame = @frameList[current_frame_index]
    previous_frame = @frameList[previous_frame_index] if ( 0 <= previous_frame_index )
    before_previous_frame = @frameList[before_previous_frame_index] if ( 0 <= before_previous_frame_index )
    
    if previous_frame != nil
      case previous_frame.status
      when FrameStatus::Strike
        previous_frame.bonus( current_frame.bowl1 + current_frame.bowl2 )
      when FrameStatus::Spare
        previous_frame.bonus( current_frame.bowl1 )
      else
      end
    end
    
    if before_previous_frame != nil
      if (before_previous_frame.status == FrameStatus::Strike) && (previous_frame.status == FrameStatus::Strike)
        before_previous_frame.bonus( current_frame.bowl1 )
      end
    end
  end
  
end
