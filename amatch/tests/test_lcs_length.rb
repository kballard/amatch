require 'test/unit'
require 'amatch'

class TC_LCSLength < Test::Unit::TestCase
  D = 0.000001

  def setup
    @small   = Amatch.new('test')
    @empty   = Amatch.new('')
  end

  def test_empty_subsequence
    assert_in_delta 0, @empty.lc_subsequence(''), D
    assert_in_delta 0, @empty.lc_subsequence('a'), D
    assert_in_delta 0, @small.lc_subsequence(''), D
    assert_in_delta 0, @empty.lc_subsequence('not empty'), D
  end

  def test_empty_substring
    assert_in_delta 0, @empty.lc_substring(''), D
    assert_in_delta 0, @empty.lc_substring('a'), D
    assert_in_delta 0, @small.lc_substring(''), D
    assert_in_delta 0, @empty.lc_substring('not empty'), D
  end

  def test_small_subsequence
    assert_in_delta 4, @small.lc_subsequence('test'), D
    assert_in_delta 4, @small.lc_subsequence('testa'), D
    assert_in_delta 4, @small.lc_subsequence('atest'), D
    assert_in_delta 4, @small.lc_subsequence('teast'), D
    assert_in_delta 3, @small.lc_subsequence('est'), D
    assert_in_delta 3, @small.lc_subsequence('tes'), D
    assert_in_delta 3, @small.lc_subsequence('tst'), D
    assert_in_delta 3, @small.lc_subsequence('best'), D
    assert_in_delta 3, @small.lc_subsequence('tost'), D
    assert_in_delta 3, @small.lc_subsequence('tesa'), D
    assert_in_delta 2, @small.lc_subsequence('taex'), D
    assert_in_delta 1, @small.lc_subsequence('aaatbbb'), D
    assert_in_delta 1, @small.lc_subsequence('aaasbbb'), D
    assert_in_delta 4, @small.lc_subsequence('aaatestbbb'), D
  end

  def test_small_substring
    assert_in_delta 4, @small.lc_substring('test'), D
    assert_in_delta 4, @small.lc_substring('testa'), D
    assert_in_delta 4, @small.lc_substring('atest'), D
    assert_in_delta 2, @small.lc_substring('teast'), D
    assert_in_delta 3, @small.lc_substring('est'), D
    assert_in_delta 3, @small.lc_substring('tes'), D
    assert_in_delta 2, @small.lc_substring('tst'), D
    assert_in_delta 3, @small.lc_substring('best'), D
    assert_in_delta 2, @small.lc_substring('tost'), D
    assert_in_delta 3, @small.lc_substring('tesa'), D
    assert_in_delta 1, @small.lc_substring('taex'), D
    assert_in_delta 1, @small.lc_substring('aaatbbb'), D
    assert_in_delta 1, @small.lc_substring('aaasbbb'), D
    assert_in_delta 4, @small.lc_substring('aaatestbbb'), D
  end
end
  # vim: set et sw=2 ts=2:
