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

require 'rails_helper'
describe "the topic page", :type => :feature do
before :each do
  let! (:topic){ Topic.create(name: 'steven')} #let is lazily evaluated.

end

it 'shows a list of topics' do
  t = Topic.create!{name: 'blah'}
  visit '/'
  save_and_open_page # rails method
  expect(page).to  have_content t.name
  expect(page).to  have_content topic.name
end