desc "This task is called by the Heroku scheduler add-on"

task :reset_application => :environment do
  Task.destroy_all
  List.destroy_all
  List.create(:name => 'My Installation Todo List')
  id = List.all.last.id
  Task.create(:name => "", :list_id => id)
  Task.create(:name => "Build a great web application", :list_id => id)
  Task.create(:name => "Add Phrase to my application", :list_id => id)
  Task.create(:name => "Translate application with Phrase to reach more people", :list_id => id)
end
