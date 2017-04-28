# # Write an method that takes an array of integers and an integer to search for
# def search_array(array, number)
# 	counter = 0
# 	number = number.to_i

# 	while counter < array.length
# 		if array[counter] == number 
# 			return counter
# 		else
# 			counter += 1
# 		end	
# 	end	

# end
# puts search_array([1,2,3,4], 3)


# # Define a method where you pass in a number and it returns all the fibonacci terms
# def fib_method(number)
# 	counter = 1
# 	array = []

# 	while counter <= number
# 		if counter == 1
# 			array.push(0)
# 		elsif counter == 2
# 			array.push(1)
# 		else
# 			array[counter - 1] = array[counter - 2] + array[counter - 3]	
# 		end		
# 		counter += 1
# 	end
# 	return array
# end

# puts fib_method(10)


# BUBBLE SORT - ORDERS A NUMBER ARRAY
def bubble_sort(array)
  array.any? { |x| 
    if !x.is_a? Numeric
      abort "Not all values are numbers.  That's a bummer dude :-(."
    end 
  }
  
  swapped = true
  
  while swapped == true
  swapped = false
  counter = 0
  
    while counter < array.length
      if counter == 0 || array[counter] > array[counter - 1]
        counter += 1
        next
      end
      
      if array[counter] < array[counter - 1]
        array[counter], array[counter - 1] = array[counter - 1], array[counter]
        swapped = true
      else
        break
      end
    counter += 1
    end
  end
  
  return array
end

# puts bubble_sort([1,3,4,"a"])
puts bubble_sort([1,5,4,2,9])