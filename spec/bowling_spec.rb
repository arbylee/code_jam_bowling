require_relative '../app/bowling'
require_relative '../app/turn'

describe Bowling do
  it "should score 0 for a all gutter ball game" do
    turns = []
    10.times { add_empty_turn_to(turns) }
    Bowling.new(turns).score.should == 0
  end

  it "should score 1 if knock 1 pin down" do
    turns = []
    9.times {add_empty_turn_to(turns)}
    turns << Turn.new(1,0)
    Bowling.new(turns).score.should == 1
  end

  it "should know how to score a spare" do
    turns = []
    8.times { add_empty_turn_to(turns) }
    turns << Turn.new(5,5)
    turns << Turn.new(5,0)
    # 15 + 5
    Bowling.new(turns).score.should == 20
  end

  it "should know how to score two spares in a row" do
    turns = []
    7.times {add_empty_turn_to(turns)}
    2.times {turns << Turn.new(5,5)}
    turns << Turn.new(3,0)
    # 15 + 13 + 3
    Bowling.new(turns).score.should == 31
  end

  it "should know how to score a strike" do
    turns = []
    8.times { add_empty_turn_to(turns) }
    turns << Turn.new(10, 0)
    turns << Turn.new(3, 3)
    # 16 + 6
    Bowling.new(turns).score.should == 22
  end

  it "should know how to score two strikes in a row" do
    turns = []
    7.times{add_empty_turn_to(turns)}
    2.times{turns << Turn.new(10,0)}
    turns << Turn.new(3,3)
    Bowling.new(turns).score.should == 45
  end

  it "should score a spare on the last throw correctly" do
    turns = []
    9.times{add_empty_turn_to(turns)}
    turns << Turn.new(5,5)
    turns << Turn.new(3,3)
    Bowling.new(turns).score.should == 13
  end

  it "should score a strike on the last throw correctly" do
    turns = []
    9.times{add_empty_turn_to(turns)}
    turns << Turn.new(10,0)
    turns << Turn.new(3,3)
    Bowling.new(turns).score.should == 16
  end 

  it "should score a strike on the last throw plus 2 strikes" do
    turns = []
    9.times{add_empty_turn_to(turns)}
    turns << Turn.new(10,0)
    turns << Turn.new(10,0)
    turns << Turn.new(10,0)
    Bowling.new(turns).score.should == 30
  end

  it "should score a perfect game as 300" do
    turns = []
    12.times { turns << Turn.new(10,0) }
    Bowling.new(turns).score.should == 300
  end

  def add_empty_turn_to turn_array
    turn_array << Turn.new(0,0)
  end
end