require 'diary_entry'

RSpec.describe DiaryEntry do
  context "initializes a title in a new class object" do
    it "constructs a new DiaryEntry Class Object" do
      entry = DiaryEntry.new("Title", "This is the content of the entry")
      expect(entry.title).to eq("Title")
      expect(entry.contents).to eq("This is the content of the entry")
    end
  end

  describe "#count_words" do
    context "calling the count_words method given a title and content with 200 words in it" do
      it "returns the amount of words in the content, 200" do
        content = ("content " * 200)
        entry = DiaryEntry.new("Title", content)
        expect(entry.count_words).to eq(200)
      end
    end

    context "empty content given" do
      it "returns 0" do
        entry = DiaryEntry.new("Title", "")
        expect(entry.count_words).to eq(0)
      end
    end
  end

  describe "#reading_time" do
    context "given a wpm of a sensible number (200)" do
      it "returns 2 (ceiling of a number) when given content with 300 words" do
        content = ("content " * 300)
        entry = DiaryEntry.new("Title", content)
        expect(entry.reading_time(200)).to eq(2)
      end
    end

    context "given a wpm of 0" do
      it 'fails' do
        entry = DiaryEntry.new("Title", "one two three")
        expect {entry.reading_time(0)}.to raise_error "Reading speed must be greater than 0"
      end
    end   
  end

  describe "#reading_chunk" do
    context "with contents readble within the given time" do
      it "returns the full content" do
        entry = DiaryEntry.new("Title", "content content content")
        chunk = entry.reading_chunk(200, 1)
        expect(chunk).to eq("content content content")
      end
    end

    context "with a contents unreadble within the given time" do
      it "returns the readable chunk" do
        entry = DiaryEntry.new("Title", "content content three")
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq("content content")
      end

      it "returns the next chunk, next time we are asked" do
        entry = DiaryEntry.new("Title", "content content three")
        entry.reading_chunk(2, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq("three")
      end

      it "restarts after reading the whole content" do
        entry = DiaryEntry.new("Title", "content content three")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(2, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq("content content")
      end

      it "restarts if it finishes exactly on the end" do
        entry = DiaryEntry.new("Title", "content content three")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(1, 1)
        chunk = entry.reading_chunk(2, 1)
        expect(chunk).to eq("content content")
      end
    end
  end
end