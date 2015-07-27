require 'rails_helper'

feature "User logs in", :type => :feature do

  let! (:test_user) {User.create!(username:'Alina', password: '12345')}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  it "with username and password" do
    visit '/'
    fill_in("username", :with => 'Alina')
    fill_in("password", :with => '12345')
    click_button "Log In"
    save_and_open_page
    expect(page).to have_content('Logout')
   end

end