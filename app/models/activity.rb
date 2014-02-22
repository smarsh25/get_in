# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :contents
end
