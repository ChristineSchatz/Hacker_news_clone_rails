require 'rails_helper'

feature "User signs up", :type => :feature do
  it "with username and password" do
    visit '/'
    fill_in("user[username]", :with => 'Jon')
    fill_in("user[password]", :with => '1234')
    click_button "Create User"
#    save_and_open_page
    expect(page).to have_content 'Logout'
   end

end