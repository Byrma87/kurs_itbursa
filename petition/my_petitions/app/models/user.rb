class User < ActiveRecord::Base
  has_many :petitions
  has_many :votes
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

end