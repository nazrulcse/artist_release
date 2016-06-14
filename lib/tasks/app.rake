namespace :app do
  task :generate_user_slug => :environment do
    User.find_each(&:save)
  end

  task :generate_event_slug => :environment do
    Event.find_each(&:save)
  end
end