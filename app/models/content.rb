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

# class Content - ActiveRecord
class Content < ActiveRecord::Base
  scope :group_by_month,   -> { group("date_trunc('month', eventdate) ") }
  belongs_to :activity

  # initialize eventdate to created_at (for now, until we add ui to do add it)
  before_create do |content|
    content.eventdate.nil? ? content.eventdate = content.created_at.to_s.split(" ")[0].to_date : nil
  end
end
