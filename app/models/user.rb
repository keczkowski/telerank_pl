class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :agreements, :dependent => :restrict_with_error
  has_many :reminders, :dependent => :restrict_with_error
  has_many :calls, :dependent => :restrict_with_error
  has_many :events, :dependent => :restrict_with_error
  has_many :clients, :dependent => :restrict_with_error

  validates_presence_of :name

end
