require_relative '../classes/game'

describe Game do

  it "should return true" do
    game_1 = Game.new("Yes", "2007-02-11")
    allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
    expect(game_1.can_be_archived?).to be true
  end

  it "should return true" do
    game_1 = Game.new("Yes", "2022-02-11")
    allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
    expect(game_1.can_be_archived?).to be false
  end

  it "should return true" do
    game_1 = Game.new("Yes", "2014-02-11")
    allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
    expect(game_1.can_be_archived?).to be false
  end

  it "should return true" do
    game_1 = Game.new("Yes", "2022-02-11")
    allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)
    expect(game_1.can_be_archived?).to be false
  end
end