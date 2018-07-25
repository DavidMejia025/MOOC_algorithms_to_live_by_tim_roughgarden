require "pry"
def merge_sort(x)
  middle = x.length/2
  #binding.pry
  
    x_1 = []
    x_2 = []
    x.each_with_index do|item, index| 
      index<middle ? x_1 << x[index] : x_2 << x[index] 
    end
    #puts "#{merge_sort(x_2)}"
    if middle > 0
      p x_1
     result = sort(merge_sort(x_1), merge_sort(x_2))
     p "The result is #{result}"
     result
    else
      x
    end
end

def sort2(x_2,y_2)
  y = []
      i = 0
      j = 0
      k = 0

      #x_2.length*2.times do |k|
              
      #         p "#{x_2[i]} #{y_2[j]}"
      #         binding.pry
      #   if x_2[i] < y_2[j]
      #     y[k] = x_2[i]
      #     i+=1
      #   else
      #     y[k] = y_2[j]
      #     j+=1
      #   end
      # end
      [y_2,x_2] 
      [y_2,x_2].flatten 
end

def sort(x_2,y_2)
  puts "The input is #{x_2}"
  y = []
      i = 0
      j = 0
      k = 0

      x_2.length*2.times do |k|
              
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

        else
            y[k] = y_2[j]
        end
        y
      end 
     # p y 
      y
end

x = [4,3,5,2,8,1,7,6] 
 p merge_sort(x)