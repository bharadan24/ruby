require 'rubygems'
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: longest_substr.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

def longest_sub_str arg
  puts "Given String: #{arg}"

  if arg.class != String
    puts "Pass a valid string type as an argument"
    puts
    return
  elsif arg.strip.empty?
    puts "Enter a valid string"
    puts
    return
  elsif arg.strip.length == 1
    puts "Longest substring: #{arg.strip}"
    puts "Length of longest substring - #{arg.strip.length}"
    puts
    return
  end

  long_str = (arg.chr)
  i =  0

  while i <= arg.length do
    new_str = arg[i, arg.length]
    j=0

    new_long_str = ""
    while j < new_str.length do
      comb_str = new_str[j..j+1]
      if (comb_str.length > 1) and (comb_str[0].ord != comb_str[1].ord) and !(new_long_str.include?(comb_str[1]))
        new_long_str = new_str[0..j+1]
      else
        break
      end
      j += 1
      long_str = new_long_str if new_long_str.length > long_str.length
    end

    i += 1

  end

  puts "Longest substring: #{long_str.strip}"
  puts "Length of longest substring: #{long_str.strip.length}"
  puts

end


longest_sub_str ARGV[0]
longest_sub_str "azcbobobegghakl"
longest_sub_str "zvovwdoauuadteihxy"
longest_sub_str "bbbbbbb"
longest_sub_str "abcabcbb"
longest_sub_str "pwwkew"
longest_sub_str "a"
longest_sub_str "      aaaa   "
longest_sub_str "      a   "
longest_sub_str 123

