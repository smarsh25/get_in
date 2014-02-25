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

Category.create!(name: 'Sports')
c2 = Category.create!(name: 'Academics')
c3 = Category.create!(name: 'Clubs')
c4 = Category.create!(name: 'Volunteer Work')
Category.create!(name: 'Scholarships')

a1 = c2.activities.create!(title: 'SAT', body: 'Math 620, Reading/Verbal 600')
a1.contents.create(title: 'SAT results doc', body: 'link to scores online.', type: 'text')
a1.contents.create(title: 'SAT results trophy',
                   body: 'you get a trophy for such a good score.', type: 'text')

a2 = c3.activities.create!(title: 'Chess Club',
                           body: 'Club president and class champion.')
a2.contents.create(title: 'Chess club website',
                   body: 'link to chess club website.', type: 'text')

c4.activities.create!(title: 'Hands on Atlanta',
                      body: 'Residential yard cleaning.')








Profile.create!(first_name: "Bob", last_name: "Jackson", school: "Jacque Fresco High School", expected_graduation: 2017, city: "Venus, Earth", state: "Humanity")

