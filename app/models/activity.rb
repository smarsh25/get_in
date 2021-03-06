# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  accepts_nested_attributes_for :tags
  belongs_to :user
  has_many :contents, dependent: :destroy
end
