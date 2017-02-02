namespace :dev do
  task :fake_events => :environment do
    Event.destroy_all
    20.times do
      e = Event.create(:name => Faker::Name.name,
                       :description => Faker::Lorem.paragraph,
                       :category => Category.all.sample)
      e.group_ids = Group.all.map {|g| g.id if [true,false].sample}.compact
      puts e.id
    end
  end
end