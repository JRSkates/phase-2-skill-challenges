#require 'diary'

class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return 0 if @contents.empty?
    return words.count
  end

  def reading_time(wpm)
    fail "Reading speed must be greater than 0" if wpm <= 0
    return (words.length / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    readable_words = wpm * minutes
    start_from = @furthest_word_read
    end_at = @furthest_word_read + readable_words 
    word_list = words[start_from, end_at]
    if end_at >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(' ')
  end

  private

  def words
    @contents.split(" ")
  end
end