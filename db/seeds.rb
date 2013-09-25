# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..10).each do |i|
  user = User.create!(:email => "#{i}@#{i}.ru", :password => "#{i}")
  Story.create!(:description => "test description #{i}", :title => "test title #{i}", :assigned_to_id => user.id)
end
