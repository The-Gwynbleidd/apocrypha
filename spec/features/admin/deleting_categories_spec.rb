require "rails_helper"

RSpec.feature "Users can delete categories" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  scenario "successfully" do
    book = FactoryGirl.create(:category, name:"Fantasy")
    visit 'admin/categories'
    click_link "Fantasy"
    click_link "Delete Category"

    expect(page).to have_content "Category has been deleted."
    expect(page.current_url).to eq admin_categories_url
    expect(page).to have_no_content "Fantasy"
  end
end
