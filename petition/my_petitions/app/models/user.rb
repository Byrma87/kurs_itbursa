class User < ActiveRecord::Base
  has_many :petitions
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: { minimum: 2}
end