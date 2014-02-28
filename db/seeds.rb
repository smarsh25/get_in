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
User.delete_all
Profile.delete_all

user1 = User.create!(email: 'bobby@test.com',
										 password: 'asdfasdf',
										 password_confirmation: 'asdfasdf')
user1.profile.update_attributes({first_name: 'Bobby',
																 last_name: 'Jones',
                                 school: 'Riverside High',
                                 expected_graduation: 2016,
                                 city: 'Atlanta', state: 'Ga'})

user2 = User.create!(email: 'mary@test.com',
										 password: 'asdfasdf',
										 password_confirmation: 'asdfasdf')
user2.profile.update_attributes({first_name: 'Mary',
 																 last_name: 'Smith',
 																 school: 'Lakeland High',
 																 expected_graduation: '2016',
 																 city: 'Brentwood',
 																 state: 'CA'})

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
															 body:  'Math 620, Reading/Verbal 600')
activities << Activity.create!(title: 'Chess Club',
															 body: 'Club president and class champion.')
activities << Activity.create!(title: 'Hands on Atlanta',
															 body: 'Residential yard cleaning.')

# add content to the SAT Activity
activities[0].contents.create(title: 'SAT results doc',
														 	body: 'link to scores online.', kind: 'text',
															eventdate: '2012-02-27 00:00:00')
activities[0].contents.create(title: 'SAT results trophy',
															body: 'you get a trophy for such a good score.',
															kind: 'text',
															eventdate: '2013-12-31 00:00:00')

# add content to the Chess Club Activity
activities[1].contents.create(title: 'Chess club website',
															body: 'link to chess club website.',
															kind: 'text',
															eventdate: '2014-01-27 00:00:00')
activities[1].contents.create(title: 'Chess club certificate',
															body: 'stuff about chess club.',
															kind: 'text',
															eventdate: '2014-01-27 00:00:00')
activities[1].contents.create(title: 'Regional Tournament',
															body: 'Won Tournament',
															kind: 'text',
															eventdate: '2014-01-27 00:00:00')
activities[1].contents.create(title: 'Great Chess Challlenge',
															body: 'Took 2nd',
															kind: 'text',
															eventdate: '2013-12-02 00:00:00')
activities[1].contents.create(title: 'Tristate Tourney',
															body: 'Won again!',
															kind: 'text',
															eventdate: '2013-12-02 00:00:00')
activities[1].contents.create(title: 'International Competition',
															body: "Didn't do so well, but showed up",
															kind: 'text',
															eventdate: '2013-01-07 00:00:00')
activities[1].contents.create(title: 'Chess training class',
															body: 'held a intro class at school',
															kind: 'text',
															eventdate: '2012-04-22 00:00:00')
activities[1].contents.create(title: 'Chess club bake sale',
															body: 'raising money to buy new boards.',
															kind: 'text',
															eventdate: '2012-04-22 00:00:00')
activities[1].contents.create(title: 'Chess day',
															body: 'Sponsored, lead chess day at school.',
															kind: 'text',
															eventdate: '2012-03-04 00:00:00')

# assign activities to categories
activities[0].categories << categories[1]  # sat is academics
activities[1].categories << categories[2]  # chess club is clubs
activities[2].categories << categories[2]  # hands on atlanta is club
activities[2].categories << categories[3]  # hands on atlanta is volunteer work

user1.activities << activities[0]
user2.activities << activities[1]
user2.activities << activities[2]


