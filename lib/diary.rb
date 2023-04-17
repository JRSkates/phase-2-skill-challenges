#require 'diary_entry'

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def all
    @entries
  end

  def count_words
    @entries.map(&:count_words).sum
  end

  def reading_time(wpm) # wpm is an integer representing
    fail "Reading speed must be greater than 0" if wpm <= 0
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entires = @entries.select { |entry| entry.reading_time(wpm) <= minutes }
    readable_entires.sort_by { |entry| entry.reading_time(wpm) }.last
  end
end