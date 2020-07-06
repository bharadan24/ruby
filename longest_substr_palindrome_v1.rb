# Longest Palindromic substring

require "rubygems"
require 'test/unit'
require 'minitest/autorun'
extend Test::Unit::Assertions

def palin_check_recursive s, j, k
  if  (j >= 0) and (k <= s.length) and (@str_chars[j] == @str_chars[k])
    @a << s[j..k]
    palin_check_recursive s, j-1, k+1  
  end
end

def palin_pattern s, j, k
  if (j >= 0) and (k <= s.length) and (@str_chars[j] == @str_chars[k])
    palin_check_recursive s, j, k
  end
end

def longest_palindromic_substr s
  @a = []
  @str_chars = s.chars

  return lps = s if (s.length <= 1)
  return lps = s[0] if (s.length <= 2) and (s[0] != s[-1])
  return lps = s if (s.length == 2) and (s[0] == s[-1])
  return lps = s if (s.length > 2) and (s == s.reverse)

  if s.length > 2
    i = j = k = 0
    while i <= s.length do
      if (@str_chars[i] == @str_chars[i+1]) #and !(@str_chars[i] == @str_chars[i+2])
        @a << s[i..i+1]
        j = i - 1
        k = i + 2
        palin_pattern s, j, k
      elsif @str_chars[i] == @str_chars[i+2]
        @a << s[i..i+2]
        j = i - 1
        k = i + 3
        palin_pattern s, j, k
      end
      i += 1
    end
    lps = @a.max_by(&:length)
  end
  if lps.empty? and s.length > 2
    return s[0]
  else
    lps
  end
end

class LongestPalindromicSubstrTest < Minitest:: Test

  def test_aba_failing_cases
    assert_equal("sooos", "#{longest_palindromic_substr "absooosasa"}", "TC18: FAIL") # This usecase currently is failing :/
    assert_equal("sooos", "#{p longest_palindromic_substr "azwdzwmwcqzgcobeeiphemqbjtxzwkhiqpbrprocbppbxrnsxnwgikiaqutwpftbiinlnpyqstkiqzbggcsdzzjbrkfmhgtnbujzszxsycmvipjtktpebaafycngqasbbhxaeawwmkjcziybxowkaibqnndcjbsoehtamhspnidjylyisiaewmypfyiqtwlmejkpzlieolfdjnxntonnzfgcqlcfpoxcwqctalwrgwhvqvtrpwemxhirpgizjffqgntsmvzldpjfijdncexbwtxnmbnoykxshkqbounzrewkpqjxocvaufnhunsmsazgibxedtopnccriwcfzeomsrrangufkjfzipkmwfbmkarnyyrgdsooosgqlkzvorrrsaveuoxjeajvbdpgxlcrtqomliphnlehgrzgwujogxteyulphhuhwyoyvcxqatfkboahfqhjgujcaapoyqtsdqfwnijlkknuralezqmcryvkankszmzpgqutojoyzsnyfwsyeqqzrlhzbc"}", "TC19: FAIL")
  end

  def test_when_string_is_empty
    assert_equal("", "#{longest_palindromic_substr ""}", "TC1: FAIL")
  end

  def test_when_string_has_one_character
    assert_equal("a", "#{longest_palindromic_substr "a"}", "TC2: FAIL")
  end

  def test_when_string_has_2_different_characters
    assert_equal("a", "#{longest_palindromic_substr "ac"}", "TC3: FAIL")
  end

  def test_when_string_has_2_same_characters
    assert_equal("aa", "#{longest_palindromic_substr "aa"}", "TC4: FAIL")
  end

  def test_when_string_has_no_palindrome
    assert_equal("a", "#{longest_palindromic_substr "abcda"}", "TC5: FAIL")
  end

  def test_when_entire_string_is_a_palindrome
    assert_equal("babababab", "#{longest_palindromic_substr "babababab"}", "TC6: FAIL")
    assert_equal("cattac", "#{longest_palindromic_substr "cattac"}", "TC7: FAIL")
  end

  def test_when_string_has_aa_patterns
    assert_equal("aa", "#{longest_palindromic_substr "aab"}", "TC8: FAIL")
    assert_equal("bb", "#{longest_palindromic_substr "cbbd"}", "TC9: FAIL")
    assert_equal("atta", "#{longest_palindromic_substr "cattab"}", "TC10: FAIL")
    assert_equal("aattaa", "#{longest_palindromic_substr "caattaab"}", "TC11: FAIL")
    assert_equal("taabaat", "#{longest_palindromic_substr "caattaabaataab"}", "TC12: FAIL")
  end

  def test_same_even_sequence
    assert_equal("494", "#{(longest_palindromic_substr "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg").length}",  "TC13: FAIL") 
  assert_equal("ffffff", "#{longest_palindromic_substr "ffffffggggg"}", "TC14: FAIL")
  end

  def test_when_string_has_aba_patterns
    assert_equal("aaaaabaaaaa", "#{longest_palindromic_substr "aaaaabaaaaaa"}", "TC15: FAIL")
    assert_equal("bab", "#{longest_palindromic_substr "babad"}", "TC16: FAIL")
    assert_equal("aba", "#{longest_palindromic_substr "aaba"}", "TC17: FAIL")
  end
end


