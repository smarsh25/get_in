# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :users, through: :activities
  has_many :tags, dependent: :destroy
  has_many :activities, through: :tags, dependent: :destroy
end
