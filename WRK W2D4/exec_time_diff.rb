require 'byebug'
# arrays for pry testing
a = [0, 3, 5, 4, -5, 10, 1, 90] # largest contiguous sum => 108 from [0, 3, 5, 4, -5, 10, 1, 90]
b = [5, 3, -7] # largest contiguous sum => 8 from [5, 3]
c = [2, 3, -6, 7, -6, 7] # largest contiguous sum => 8 from [7, -6, 7]
d = [-5, -1, -3] # largest contiguous sum => -1 from [-1]

# O(n^2)
def my_min_n2(arr)
  arr.each_with_index do |comp_el, idx|
    im_the_smallest = true
    (idx + 1).upto(arr.length - 1) do |j|
      im_the_smallest = false if comp_el > arr[j]
    end
    return comp_el if im_the_smallest == true
  end
end

#O(n)
def my_min_n(arr)
  min = arr.first
  arr.shift
  arr.each do |ele|
    min = ele if ele < min
  end
  min
end

# O(n^3)
def largest_contiguous_subsum(list)
  sub_arrys = []
  list.each_with_index do |first_el, idx|
    sub_a = [[first_el]]
    (idx + 1).upto(list.length - 1) do |j|
      sub_a << list[idx..j]
    end
    sub_arrys += sub_a
  end

  largest_ar = sub_arrys.shift
  largest_sum = largest_ar.inject(:+)
  sub_arrys.each do |subs|
    sum = subs.inject(:+)
    if sum > largest_sum
      largest_ar = subs
      largest_sum = sum
    end
  end
  "#{largest_sum} from #{largest_ar}"
end

# O(n) time, O(1) memory
def better_contiguous_sum(list)
  current_rolling_sum = list.shift
  max_rolling_sum = current_rolling_sum

# debugger

  list.each do |number|
    if current_rolling_sum + number > 0
      current_rolling_sum += number
      max_rolling_sum = current_rolling_sum if current_rolling_sum > max_rolling_sum
    else
      max_rolling_sum = current_rolling_sum if current_rolling_sum > max_rolling_sum
      current_rolling_sum = 0
    end
  end
  max_rolling_sum

end
