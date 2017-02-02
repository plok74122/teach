namespace :dev do
  task :fake_events => :environment do
    Event.destroy_all
    20.times do
      e = Event.create(:name => Faker::Name.name,
                       :description => Faker::Lorem.paragraph,
                       :category => Category.all.sample)
      e.group_ids = Group.all.map {|g| g.id if [true,false].sample}.compact
      (0..20).to_a.sample.times do
        e.attendees.create(:name => Faker::Name.name)
      end
      puts e.id
    end
  end
end