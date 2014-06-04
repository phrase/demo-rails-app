desc "This task is called by the Heroku scheduler add-on"

task :reset_application => :environment do
  puts "Reseting application"
  Task.destroy_all
  List.destroy_all
  puts "creating data"
  List.create(:name => 'Welcome')
  id = List.all.last.id
  Task.create(:name => "Welcome to PhraseApp", :list_id => id)
  Task.create(:name => "Please Visit us on: PhraseApp.com for more information.", :list_id => id)
  puts "done."
end