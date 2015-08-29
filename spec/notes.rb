# bundle
# bundle exec rails generate rspec:install

# in rails helper
# require 'rails_helper' in your spec file
# require 'rspec/rails'
# git diff "filename" will show you changes made to that file.
# git diff --cached

# you'll need a spec folder

#always ensure you're starting from a clean database, using DatabaseCleaner
# the database_cleaner.rb file will be in your support folder.

# DatabaseCleaner.strategy, truncation, deletion, transaction. look these up!
#before each...you can strategy
# run rake spec in your terminal

# require 'rails_helper'
# describe "the topic page", :type => :feature do
#   let! (:topic){ Topic.create(name: 'steven')} #let is lazily evaluated.
#   let! (:test_user) {User.create!(usermae: 'christine', password: '12345')}


# before :each do

# end

# it 'shows a list of topics' do
#   t = Topic.create!{name: 'blah'}
#   visit '/'
#   save_and_open_page # rails method
#   expect(page).to  have_content t.name
#   expect(page).to  have_content topic.name
# end

# it "includes clickable topics" do
#   visit '/'
#   click_link topic.name
#   expect(page).to have_selector('[data-purpose="topic_name"]')

# end

# you can add "data-purpose" tag to h1 tag for testig purposes..you can also add other tags...forgot! ask zach! adding attributes on an element topic

# unix talk

# bundler ! research this for thursday's talk 5-minute with examples

# Rspec to test users. replace current_user style method
# stubbing
# before: each do
#   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
# end

# it "shows a list of topics" do
#   visit '/'
#   expect(page).to have_content topic.name
# end


# TESTING A CONTROLLER rake spec:controllers

# Rspec.desribe TopicsController, :type => :controller do
#    let {:some_user} { User.create blah bah}
  #  let  {:sample_topic} {Topic.create!(name: "gaga") }
#    before :each do
#     allow_any_instance of blah blah
#   end

# describe "#index" do
#   it "assigns @posts" do
#     topic = Topic.create!(name: "blah")
#     get :index
#     expect(assigns(:topics)).to eq

#   end

#     it "renders index " do
#       get :index
#       expect(response).to render_templates("index")

#     end
#   end
# end


#find returns error and find_by returns nil if object not found

# describe "show" do
#   it "assigns a topic" do
#     get :show, id: sample_topic.id
#     expect(assigns(:topic)).to eq(sample_topic)
#   end

#   it "renders show" do
#     get :show, id: sample_topic.id
#     expect(response).to render_template("show")
#   end

# end

# describe "#update" do
#   it "saves a valid update" do
#     put :update, {id: sample_topic.id, topic:{name: 'Aweosme topic'}}
#     expect(response).to redirect_to topic_path(sample_topic.reload)
#   end

#   it "wont save a bad update" do
#     old_name = sample_topic.name
#     put :update, {id: sample_topic.id,  topic:{name: nil}}
#     expect(response).to render_template("edit")
#     expect(sample_topic.reload.name).to eq("gaga")
#   end
#  end

# describe 'delete' do
#   it 'deletes the topic' do
#     old_count = Topic.count
#     delete :delete, id: sample_topic.id
#     expect(response).to redirect_to(topics_path)
#     expect(Topic.count).to eq(old_count - 1)
#     expect(Topic.where(id: sample_topic.id).count).to_eq(0)
#   end
# end

# end

