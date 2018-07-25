require "pry"
def merge_sort(x)
  middle = x.length/2
  if middle > 1
    x_2 = []
    y_2 = []
    x.each_with_index do|item, index| 
      index<middle ? x_2 << x[index] : y_2 << x[index] 
    end
    puts "#{x_2} #{y_2}"
    merge_sort(x_2)
    merge_sort(y_2)
  else
    y = []
    i = 0
    j = 1
    x = x.each_with_index do|item, index| 
        if j<=index && x[i] > x[j]
          y[index] = x[j]
          j=j+1
        else
          y[index] = x[i]
          i = i+1
        end
    end
  end
end

def sort(x_2,y_2)
  x = []
  x.length*2.times do 

  end
end

x = [4,3,5,2,8,1,7,6] 
p merge_sort(x)