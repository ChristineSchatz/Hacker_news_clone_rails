require 'rails_helper'

feature "User logs out", :type => :feature do

  let! (:test_user) {User.create!(username:'Alina', password: '12345')}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  it "and goes back to home page" do
    visit '/'
    fill_in("username", :with => 'Alina')
    fill_in("password", :with => '12345')
    click_button "Log In"
    click_link 'Logout'
    save_and_open_page
    expect(current_path).to eq(root_path)
   end

end