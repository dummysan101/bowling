module InputChecker
  LastFrame = 10
  def check_bowl_result(frame, data)
    begin
      if frame != LastFrame
        return false unless ( ( 1 <= data.size ) && ( data.size <= 2 ) )
      else
        return false unless ( ( 1 <= data.size ) && ( data.size <= 3 ) )
      end
      
      return false unless check_number(data)
      return false unless check_total(data)
      
      return true
    rescue
      return false
    end
  end
  
private
  def check_number(data)
    result = true
    data.each do |x|
      unless ( ( 0 <= x ) && ( x <= 10 ) )
        result = false
        break
      end
    end
    return result
  end
  
  def check_total(data)
    result = false
    maximum = 0
    case data.size
    when 1..2
      maximum = 10
    when 3
      maximum = 30
    else
      maximum = 0
      return false
    end
    
    return ( data.inject{|sum,x| sum += x } <= maximum )
  end
end
