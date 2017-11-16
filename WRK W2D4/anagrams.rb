require 'byebug'

#O(n!)
def first_anagram(str, ana)
  str_arr = str.split('').permutation.to_a #O(str.length!)
  str_arr.map! do |letters|
    letters.join
  end
  str_arr.include?(ana)

end

#O(n)
def second_anagram(str, ana)
  str_arr = str.split('')
  ana_arr = ana.split('')
  str.chars do |letter|
    if ana_arr.include?(letter)
      ana_arr.delete(letter)
      str_arr.delete(letter)
    end
  end
  str_arr.empty? && ana_arr.empty?
end

#O(n log(n))
def third_anagram(str, ana)
  str.split("").sort == ana.split("").sort
end

#O(n)
def fourth_anagram
  # some hash B.S.
end
