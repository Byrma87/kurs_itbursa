class Petition < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  # atrr_accessor :petition
  validates :title, presence: true, length: { minimum: 3}
  validates :text, presence: true, length: { minimum: 5}

end