# == Schema Information
#
# Table name: business_profiles
#
#  id           :integer          not null, primary key
#  name         :string
#  logo         :string
#  description  :text
#  head_count   :integer
#  website_link :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#

class BusinessProfile < ActiveRecord::Base
  has_many :business_users
  has_many :users, through: :business_users
  has_many :events

  acts_as_taggable

  extend FriendlyId
  friendly_id :name, use: :slugged
end
