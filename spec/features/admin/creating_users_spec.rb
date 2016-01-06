require "rails_helper"
RSpec.feature "Admins can create new users" do
  let(:admin){FactoryGirl.create(:user, :admin)}

  before do
    login_as(admin)
    visit '/admin'
    click_link "Users"
    click_link "New User"
  end

  scenario "with valid details" do
    fill_in "Email", with:"newbie@example.com"
    fill_in "Password", with:"password"
    click_button "Create User"
    expect(page).to have_content "User has been created."
  
  end
end
