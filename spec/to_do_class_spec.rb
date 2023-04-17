require 'to_do_class'

RSpec.describe ToDoClass do
  context "Creating a new ToDoClass object" do
    it "should initilize an empty array" do
      new_list = ToDoClass.new
      expect(new_list.list).to eq []  
    end
  end

  context "adding a new items to the list" do
    it "should add an item to the list" do
      new_list = ToDoClass.new
      new_list.add("Go for a run")
      expect(new_list.list).to eq ["Go for a run"]
    end

    it "should return multiple items after adding more than one item" do
      new_list = ToDoClass.new
      new_list.add("Go for a run")
      new_list.add("Go to the shops")
      new_list.add("Walk the dog")
      expect(new_list.list).to eq ["Go for a run", "Go to the shops", "Walk the dog"] 
    end
  end

  context "removing an item from the list" do
    it "should remove the specified item from the list" do
      new_list = ToDoClass.new
      new_list.add("Go for a run")
      new_list.add("Go to the shops")
      new_list.add("Walk the dog")
      new_list.complete("Go to the shops")
      expect(new_list.list).to eq ["Go for a run", "Walk the dog"]
    end

    it "should let the user know that the item is not in the list" do
      new_list = ToDoClass.new
      new_list.add("Go for a run")
      new_list.add("Go to the shops")
      new_list.add("Walk the dog")
      expect(new_list.complete("Buy milk")).to eq "This task is not in the list"
    end
  end
end