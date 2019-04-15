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
      expect(page).to have_content("The population is #{population}.")
      expect(page).to have_content("The per-capita-income is #{income}.")
      expect(page).to have_content("The walk score is #{walkscore}.")
      expect(page).to have_content("The bike score is #{bikescore}.")
    end
  end
end
