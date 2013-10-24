require_relative "../lib/input"

describe "input" do

  it "should turn the input file into an array" do
    items = Input.new("../input/input1.txt")
    items.input_file.class.should == Array
  end

  it "should create a hash with the item name, qty, and price, exclusion, import" do
    items = Input.new("../input/input1.txt")
    items_check = [ { name: "book", qty: 1, price: 12.49, good: false, import: false, total: 12.49 },
                    { name: "music CD", qty: 1, price: 14.99, good: true, import: false, total: 14.99 },
                    { name: "chocolate bar", qty: 1, price: 0.85, good: false, import: false, total: 0.85 }
                  ]
    items.parse.should == items_check
  end

end