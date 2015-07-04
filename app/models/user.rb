class User < ActiveRecord::Base
  has_one :profile
  has_many :business_users
  has_many :business_profiles, through: :business_users
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_resident_role

  def assign_resident_role
  	self.add_role :resident
  end
end