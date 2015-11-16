class Card < ActiveRecord::Base
	has_many :users, :through => :user_cards
	has_many :user_cards
end
