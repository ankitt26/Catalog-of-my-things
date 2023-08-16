require_relative '../classes/game'

describe Game do
  it "should restructure date format correctly" do
    new_game = Game.new('Yes', '11/02/2015')
    expected_date = Date.new(2015, 2, 11)
    expect(new_game.instance_variable_get(:@last_played_at)).to eq expected_date
  end

  it "should change date format to coventional format" do
    new_game = Game.new('Yes', '2017/08-23')
    expected_date = Date.new(2017, 8, 23)
    expect(new_game.instance_variable_get(:@last_played_at)).to eq expected_date
  end
end

