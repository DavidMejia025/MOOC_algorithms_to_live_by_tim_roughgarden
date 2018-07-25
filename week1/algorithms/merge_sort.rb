require "pry-byebug"
def merge_sort(x)
  middle = x.length/2
  #binding.pry
  
    x_1 = []
    x_2 = []
    x.each_with_index do|item, index| 
      index<middle ? x_1 << x[index] : x_2 << x[index] 
    end
    if middle > 0
     result = merge(merge_sort(x_1), merge_sort(x_2))
     result
    else
      x
    end
end

def merge(x_2,y_2)
  puts "The input is #{x_2} #{y_2}"

  y = []
      i = 0
      j = 0
      k = 0

      (x_2.length*2).times do |k|
              #p "#{x_2[i]} #{y_2[j]}"     
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
        y
      end 
     # p y 
      y
end

x = [4,10,3,16,2,11,1,9,12,13,6,14,5,7,2,8] 
 p merge_sort(x)