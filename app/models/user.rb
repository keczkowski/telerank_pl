class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restrict_with_error
  has_many :restrict_with_error
  has_many :restrict_with_error

  def name
    email
  end
end
