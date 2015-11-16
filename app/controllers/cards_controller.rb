class CardsController < ApplicationController
	#note: put the def current_user in applications_controller


	def index
		@user = current_user
		session[:user_id] = @user.id
		@card = Card.find(@card.id) 
	end

	def new
		@user = current_user
		session[:user_id] = @user.id
		puts @user.id
		@card = Card.new
	end

	def create
		@user = current_user
		session[:user_id] = @user.id
		@card = Card.new(card_params)
		if @card.save
			@user.cards << @card
			flash[:alert] = "Your card is saved"
			redirect_to cards_path(@card.id)
		else
			flash[:error] = @card.errors.full_messages.to_sentence
			render :new
		end	
	end



	private
	def card_params
		params.require(:card).permit(:cardnum, :cardtype, :expire_m, :expire_y)
	end


end
