# == Schema Information
#
# Table name: contents
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  title       :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Content < ActiveRecord::Base
  belongs_to :activity
end
