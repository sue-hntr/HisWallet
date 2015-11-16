class User < ActiveRecord::Base
	has_many :cards, :through => :user_cards
	has_many :user_cards
end
