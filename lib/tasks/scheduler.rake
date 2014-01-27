desc "This task is called by the Heroku scheduler add-on"
task :create_winers => :environment do
  puts "Создаем список победителей..."
  Winer.createwiners
  puts "done."
end

#heroku run rake update_feed