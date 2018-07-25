require "pry-byebug"

def merge_sort(x)
  middle = x.length/2 
  x_2 = []
  y_2 = []
  
  x.each_with_index do|item, index| 
    index<middle ? x_2 << x[index] : y_2 << x[index] 
  end

  if middle > 0
    merge(merge_sort(x_2), merge_sort(y_2))
  else
    x
  end
end

def merge(x_2,y_2)
  y = []
  i = 0
  j = 0
  (x_2.length*2).times do |k|    
    if x_2[i] && y_2[j]
      if x_2[i] < y_2[j]
        y[k] = x_2[i]
        i+=1
      else
        y[k] = y_2[j]
        j+=1
      end
    elsif x_2[i]
        y[k] = x_2[i]
        i += 1

    else
        y[k] = y_2[j]
        j += 1
    end
  end 
  y
end

x = [4,10,3,16,15,11,1,9,12,13,6,14,5,7,2,8] 
p "Input array  = #{x}"
p "Sorted array = #{merge_sort(x)}"