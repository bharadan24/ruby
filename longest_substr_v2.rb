require "rubygems"

def longest_str s
  h = {}
  long_substr = 0

  orig_start_index = -1

  s.chars.each_with_index do |str_value, str_index|
    hash_index = h[str_value]

    orig_start_index = hash_index if hash_index != nil && hash_index > orig_start_index

    h[str_value] = str_index

    new_length = str_index - orig_start_index

    long_substr = new_length if new_length > long_substr
  end
  long_substr
end

