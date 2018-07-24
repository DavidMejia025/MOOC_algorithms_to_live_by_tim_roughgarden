# The set of methods here corresponds to the solution of the integer multiplication procedures.
require "pry"
def third_grade(x_0, y_0)
  x = x_0.to_s.split("").map{|number| number.to_i}.reverse
  y = y_0.to_s.split("").map{|number| number.to_i}.reverse
   partial_result = y.reduce([])do|result, y_i|
    carry = 0;
    result << x.reduce([])do|row_i, x_i|
      partial = x_i*y_i
      partial += carry
      carry = 0
      if partial > 9
        carry = partial/10
        partial = partial-carry*10
      end
       row_i.unshift(partial)
    end
    if carry > 0
      [result.first.unshift(carry)]
    end
    result
  end
  partial_result = partial_result.map{|num_i| num_i.join("").to_i}
  shift_rows(partial_result).sum
end

def shift_rows(input)
  index = input.length
  index.times do|count|
    input[count]= input[count]*10**(count)
  end 
  input
end 

def timer(function)
  time = Time.now
    function
  p "time_elapsed = #{Time.now-time}"
end

def recursive_algorithm(x,y)
  n = x.digits.length

  a = x/10**(n/2)
  b = x-a*10**(n/2)
  c = y/10**(n/2)
  d = y-c*10**(n/2)

  if n == 1 
    x*y 
  else
    10**n*recursive_algorithm(a,c)+10**(n/2)*(recursive_algorithm(a,d)+recursive_algorithm(b,c))+recursive_algorithm(b,d)
  end
end

def karatsuba(x,y)
  n = x.digits.length

  a = x/10**(n/2)
  b = x-a*10**(n/2)
  c = y/10**(n/2)
  d = y-c*10**(n/2)

  if n == 1
    puts "entra n == 1"
    puts "#{x} #{y}" 
    #binding.pry
    x*y
  else 
    #binding.pry
    a_c = karatsuba(a,c)
    b_d = karatsuba(b,d)
    10**n*(a_c)+10**(n/2)*(karatsuba((a+b),(c+d))-a_c-b_d)+b_d
  end
end

x = 1231000000000000
y = 1231000000000000

puts "Third grade multiplication: \n"

#timer(third_grade(x,y))
#p "results"
p third_grade(x,y)
puts "STD multiplication: \n"
#timer(x*y)

puts "Recursive multiplication: \n"
#timer(recursive_algorithm(x,y))
#p "results"
p recursive_algorithm(x,y)

puts "Karatsuba multiplication: \n"
#timer(karatsuba(x,y))
#p "results"
p karatsuba(x,y)
p x*y
p x*y == third_grade(x,y)
