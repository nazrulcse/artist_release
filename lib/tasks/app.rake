namespace :app do
  task :generate_user_slug => :environment do
    User.find_each(&:save)
  end

  task :generate_event_slug => :environment do
    Event.find_each(&:save)
  end

  task :approve_users => :environment do
    User.all.collect { |user| user.update_attribute('is_approved', true) }
  end

end