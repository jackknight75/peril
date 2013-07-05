require 'spec_helper'

require_relative "named_slug_examples"

describe Game do
  it_behaves_like "named slug"

  it "has many categories" do
    game     = FactoryGirl.create(:game)
    category = FactoryGirl.create(:category, game_id: game.id)
    expect(game.categories).to eq([category])
  end

  it "preserves the order of categories" do
    game       = FactoryGirl.create(:game)
    categories = Array.new(3) { FactoryGirl.create(:category, game: game) }
    expect(game.categories).to eq(categories)
  end
end