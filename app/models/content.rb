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
#  kind        :string(255)
#

class Content < ActiveRecord::Base
  belongs_to :activity, dependent: :destroy
end
