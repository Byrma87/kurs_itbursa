class Vote < ActiveRecord::Base
has_many :petitions
has_many :users

end
