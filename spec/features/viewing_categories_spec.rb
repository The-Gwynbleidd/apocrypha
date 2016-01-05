require "rails_helper"
RSpec.feature "Users can view categories" do

  scenario "View category details" do
    category = FactoryGirl.create(:category, name:"Fantasy")
    visit '/categories'
    click_link "Fantasy"
    expect(page.current_url).to eq category_url(category)

  end
end
