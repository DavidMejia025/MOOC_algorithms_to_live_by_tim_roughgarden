require "pry-byebug"
def merge_sort(x)
  middle = x.length/2
  x_2 = []
  y_2 = []
  x.each_with_index do|item, index|
    index<middle ? x_2 << x[index] : y_2 << x[index]
  end
  if middle > 1
    puts "#{x_2} #{y_2}"
    merge_sort([merge_sort(x_2), merge_sort(y_2)])
  else
    sort(x_2, y_2).flatten
  end
end

def sort(x_2,y_2)
  x_2 = x_2.flatten
  y_2 = y_2.flatten
   s = []
   i = 0
   j = 0
   #puts "#{x_2} #{y_2}"

   (x_2.length*2).times do |k|
     #p " Sub is: #{x_2[i]} #{y_2[j]}"
     #puts " #{k}"
     if x_2[i] && y_2[j]
       if x_2[i]< x_2[j]
         s[k] = x_2[i]
         i+=1
       else
         s[k] = y_2[j]
         j+=1
       end
     else
       if x_2[i]
         s[k] = x_2[i]
       else
         s[k] = y_2[j]
     end

   end
   end

   s
end

x = [4,3,5,2,8,1,7,6]
 p merge_sort(x)
