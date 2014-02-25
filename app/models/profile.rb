# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  first_name          :string(255)
#  last_name           :string(255)
#  school              :string(255)
#  expected_graduation :integer
#  city                :string(255)
#  state               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  image               :string(255)
#

class Profile < ActiveRecord::Base
  belongs_to :user
end
