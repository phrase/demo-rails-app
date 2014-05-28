# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

List.create(:name => 'Welcome')
List.create(:name => 'Inbox')

Task.create(:name => "Welcome to PhraseApp", :list_id => 1)
Task.create(:name => "Please Visit us on: PhraseApp.com for more information.", :list_id => 1)