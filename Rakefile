# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

David::Application.load_tasks

task :clean do
  puts "\n~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "   Cleaning up Assets"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~\n\n"
  `rm -rf tmp`
  puts "Deleted tmp"
  `rm -rf public/assets`
  puts "Deleted public/assets"
  `rm -rf public/system`
  puts "Deleted public/system"
  puts "\n~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "     Have a nice day"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~"
end
