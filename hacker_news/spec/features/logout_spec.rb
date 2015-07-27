# require 'rails_helper'

# # feature "User logs out", :type => :feature do

# #   let! (:test_user) {User.create!(username:'Alina', password: '12345')}

# #   before :each do
# #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
# #   end

# #   it "and goes back to home page" do
# #     visit root_path
# #     click_link "Logout"
# #     save_and_open_page
# #     expect(current_path).to eq(root_path)
# #    end

# end