# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(:email => '11@11.ru', :password => '11', :password_confirmation => '11')
Story.create!(:description => 'test description', :title => 'test title', :assigned_to_id => user.id)