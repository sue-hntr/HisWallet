class User < ActiveRecord::Base

	#associations
	has_many :cards, :through => :user_cards
	has_many :user_cards

	#validations
	validates :email, uniqueness: true
	validates_presence_of :fname, on: :create
	validates :lname, presence: true
	validates_numericality_of :cash_bal, greater_than: 0, on: :create
	validates_format_of :phone, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/


end
