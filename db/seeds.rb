# This file should contain all the record creation needed to seed the
# database with its default values.
# The data can then be loaded with the rake db:seed (or created
# alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all
Activity.delete_all
Content.delete_all
Tag.delete_all

# create a set of categories
categories = []
categories << Category.create!(name: 'Sports')
categories << Category.create!(name: 'Academics')
categories << Category.create!(name: 'Clubs')
categories << Category.create!(name: 'Volunteer Work')
categories << Category.create!(name: 'Scholarships')

# create some activities
activities = []
activities << Activity.create!(title: 'SAT',
                               body: 'Math 620, Reading/Verbal 600')
activities << Activity.create!(title: 'Chess Club',
                               body: 'Club president and class champion.')
activities << Activity.create!(title: 'Hands on Atlanta',
                               body: 'Residential yard cleaning.')

# add content to some activities
activities[0].contents.create(title: 'SAT results doc',
                              body: 'link to scores online.')
activities[0].contents.create(title: 'SAT results trophy',
                              body: 'you get a trophy for such a good score.')

activities[1].contents.create(title: 'Chess club website',
                              body: 'link to chess club website.')

# assign activities to categories
activities[0].categories << categories[1]  # sat is academics
activities[1].categories << categories[2]  # chess club is clubs
activities[2].categories << categories[2]  # hands on atlanta is club
activities[2].categories << categories[3]  # hands on atlanta is volunteer work
