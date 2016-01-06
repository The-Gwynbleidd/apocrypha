require "rails_helper"

RSpec.feature "Users can create new categories for books" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit '/categories'
    click_link "Add New Category"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Fantasy"
    click_button "Create Category"
    expect(page).to have_content "Category has been created."
    title = "Fantasy"
    expect(page).to have_title title
  end

  scenario "with invalid attributes" do
    click_button "Create Category"
    expect(page).to have_content "Category has not been created."
    expect(page).to have_content "Name can't be blank"
  end

end
