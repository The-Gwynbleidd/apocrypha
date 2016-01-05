require "rails_helper"

RSpec.feature "Users can edit categories" do

  before do
    book = FactoryGirl.create(:category, name:"Fantasy")
    visit '/categories'
    click_link "Fantasy"
    click_link "Edit Category"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "SF"
    click_button "Update Category"
    expect(page).to have_content "Category has been updated."
    expect(page).to have_content "SF"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Category"
    expect(page).to have_content "Category has not been updated."
  end

end
