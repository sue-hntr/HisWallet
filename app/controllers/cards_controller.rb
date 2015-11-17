class CardsController < ApplicationController
	#note: put the def current_user in applications_controller


	def index
		@user = current_user
		session[:user_id] = @user.id
#		@card = Card.find(card_params[:id])
		@cards = Card.all
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
			redirect_to card_path(@card.id)
		else
			flash[:error] = @card.errors.full_messages.to_sentence
			render :new
		end	
	end


	def edit
		@user = current_user
		session[:user_id] = @user.id
		@card = Card.find(params[:id])
	end

	def update
		@user = current_user
		@card = Card.find(params[:id])
		session[:user_id]
		if 	@card.update(card_params)
			redirect_to card_path(@card)
		else
			render :edit
		end
	end






	def show
		@user = current_user
		session[:user_id] = @user.id
		@card = Card.find(params[:id])
	end


	private
	def card_params
		params.require(:card).permit(:cardnum, :cardtype, :expire_m, :expire_y)
	end


end
