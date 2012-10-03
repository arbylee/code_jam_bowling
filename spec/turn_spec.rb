describe Turn do
  it "should know what a spare is" do
    Turn.new(5,5).should be_a_spare
    Turn.new(3,3).should_not be_a_spare
  end

  it "should know what a strike is" do
    Turn.new(10,0).should be_a_strike
    Turn.new(3,3).should_not be_a_strike
    Turn.new(5,5).should_not be_a_strike
  end
end