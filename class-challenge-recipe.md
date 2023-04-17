# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class MyMusic
  def initialize # name is a string
    @my_track = []
  end

  def add(track) # task is a string
    @my_track.include?(track) == true ? return "You have already added this song." : @my_track.push(track)
  end

  def list
    @my_track.each { |track| track}
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 New class object initializes an empty array track list
example = MyMusic.new
expect(example.list).to eq []

# 2 Add method adds a track to the list of tracks
example = MyMusic.new
example.add("Afica")
expect(example.list).to eq ["Afica"]

# 3 Add mulitple tracks with the add method and return the list of tracks
example = MyMusic.new
example.add("Africa")
example.add("Have You Ever Seen The Rain")
example.add("Don't Dream It's Over")
expect(example.list).to eq ["Africa", "Have You Ever Seen The Rain", "Don't Dream It's Over"]

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
