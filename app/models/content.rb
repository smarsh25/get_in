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
  belongs_to :activity, dependent: :destroy
end
