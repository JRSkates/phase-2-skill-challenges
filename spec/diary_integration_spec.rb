require 'diary'
require 'diary_entry'

RSpec.describe 'diary integration test' do
  context "after adding some entries" do
    it 'lists out the entries' do
        diary = Diary.new
        diary_entry_1 = DiaryEntry.new("My Title", "My Contents")
        diary_entry_2 = DiaryEntry.new("My Title 2", "My Contents 2")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end
  end

  context "count_words method in Diary class" do
    it "counts the words in all the diary entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents")
      diary_entry_2 = DiaryEntry.new("My Title 2", "My Contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 5
    end
  end

  context "word counting behaviour" do
    it 'fails if the wpm is 0' do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents")
      diary_entry_2 = DiaryEntry.new("My Title 2", "My Contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect {diary.reading_time(0)}.to raise_error "Reading speed must be greater than 0"
    end

    it "calculates the reading time for all entries where it fits exactly" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents 1")
      diary_entry_2 = DiaryEntry.new("My Title 2", "My Contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "calculates the reading time for all entires where it falls over a minute" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents 1 1")
      diary_entry_2 = DiaryEntry.new("My Title 2", "My Contents 2")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.reading_time(2)).to eq 4
    end
  end

  context "best reading time entry behaviour" do
    it "if there is only one entry, and its readable, returns the entry" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents")
      diary.add(diary_entry_1)
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq diary_entry_1
    end

    it "if there is only one entry, and its not readable, returns nil" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("My Title", "My Contents Longer")
      diary.add(diary_entry_1)
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq nil
    end

    it "returns the longest readable entry if there is more than one" do
      diary = Diary.new
      best_entry = DiaryEntry.new("My Title", "One Two")
      diary.add(DiaryEntry.new("My Title", "One"))
      diary.add(best_entry)
      diary.add(DiaryEntry.new("My Title", "One Two Three"))
      diary.add(DiaryEntry.new("My Title", "One Two Three Four"))
      result = diary.find_best_entry_for_reading_time(2, 1)
      expect(result).to eq best_entry
    end
  end
end

# Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.