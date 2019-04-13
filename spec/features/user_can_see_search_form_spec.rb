require 'rails_helper'

describe 'when a user visits "/" ' do
  it "sees a form to enter a city state" do
    visit '/'

    expect(page).to have_css("input#city_state")
    expect(page).to have_button("Search")
  end
end
