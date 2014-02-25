# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  activity_id :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Tag < ActiveRecord::Base
  belongs_to :activity
  belongs_to :category
end
