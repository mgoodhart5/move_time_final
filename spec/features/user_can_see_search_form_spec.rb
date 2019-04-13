require 'rails_helper'

describe 'when a user visits "/" ' do
  it "sees a form to enter a city state" do
    visit '/'

    expect(page).to have_css("#location")
    expect(page).to have_button("Search")
  end
  it "fills out the form with a city and state and gets a result" do
    visit '/'
    city_state = "Denver, Co"
    population = 2888227
    fill_in :location, with: city_state
    click_button "Search"
    expect(current_path).to eq(search_path)

    within "#population-info" do
      expect(page).to have_content("The population of #{city_state} is #{population}")
    end
  end
end
