require 'rails_helper'

describe 'when a user visits "/" ' do
  it "sees a form to enter a city state" do
    visit '/'

    expect(page).to have_css("#location")
    expect(page).to have_button("Search")
  end
  it "fills out the form with a city and state and gets results" do
    @user = User.create(name: "May Kasahara")
    visit '/'
    city_state = "Denver, Co"
    population = 2888227
    income = 48435
    walkscore = 93
    bikescore = 94
    veterans = 29363
    age = 34.1
    fill_in :location, with: city_state
    click_button "Search"
    expect(current_path).to eq(search_path)

    expect(page).to have_link("Cost of Living Calculator")
    within "#all-info" do
      expect(page).to have_content("The number of veterans living here is #{veterans}.")
      expect(page).to have_content("The population is #{population}.")
      expect(page).to have_content("The median age is #{age}.")
      expect(page).to have_content("The per-capita-income is #{income}.")
      expect(page).to have_content("The walk score is #{walkscore}.")
      expect(page).to have_content("The bike score is #{bikescore}.")
    end
  end
  it "sees their user name on the button to add to favorites" do
    @user = User.create(name: "May Kasahara")
    visit '/'
    city_state = "Denver, Co"
    fill_in :location, with: city_state
    click_button "Search"
    expect(current_path).to eq(search_path)

    expect(page).to have_link("Cost of Living Calculator")
    expect(page).to have_button("Add to your favorites, #{@user.name}")
  end
  it "sees their user name on the button to add to favorites" do
    @user = User.create(name: "May Kasahara")
    visit '/'
    city_state = "Denver, Co"
    fill_in :location, with: city_state
    click_button "Search"
    expect(current_path).to eq(search_path)

    expect(page).to have_link("Cost of Living Calculator")
    click_button("Add to your favorites, #{@user.name}")
    expect(@user.favorites.count).to eq(1)
  end
end
