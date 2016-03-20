class Vote < ActiveRecord::Base
belongs_to :petitions
belongs_to :users

validates :user_id, uniqueness: { scope: :petition_id}

end
