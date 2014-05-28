desc "This task is called by the Heroku scheduler add-on"

task :reset_application => :environment do
  puts "Reseting application"
  Rake::Task["db:drop:all"].invoke
  Rake::Task["db:reset"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke
  puts "done."
end