class Card < ActiveRecord::Base

	#associations
	has_many :users, :through => :user_cards
	has_many :user_cards

	#validations
	validates :cardnum, presence: true
	validates_numericality_of :expire_m, greater_than: 0, less_than: 13, on: :create 
	validates_numericality_of :expire_y, greater_than: 2014, less_than: 2026, on: :create 

end
