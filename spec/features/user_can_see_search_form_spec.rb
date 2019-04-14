require 'rails_helper'

describe 'when a user visits "/" ' do
  it "sees a form to enter a city state" do
    visit '/'

    expect(page).to have_css("#location")
    expect(page).to have_button("Search")
  end
  it "fills out the form with a city and state and gets results" do
    visit '/'
    city_state = "Denver, Co"
    population = 2888227
    income = 48435
    walkscore = 93
    bikescore = 94
    fill_in :location, with: city_state
    click_button "Search"
    expect(current_path).to eq(search_path)

    within "#all-info" do
      expect(page).to have_content("The population of #{city_state} is #{population}.")
      expect(page).to have_content("The per-capita-income of #{city_state} is #{income}.")
      expect(page).to have_content("The walk score for #{city_state} is #{walkscore}.")
      expect(page).to have_content("The bike score for #{city_state} is #{bikescore}.")
    end
  end
end
