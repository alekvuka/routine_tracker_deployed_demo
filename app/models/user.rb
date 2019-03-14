class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  validates_confirmation_of :password

  has_many :tasks
  has_many :routines, through: :tasks

end
