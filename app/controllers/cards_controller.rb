class CardsController < ApplicationController
	#note: put the def current_user in applications_controller


	def index
		if current_user == nil
			flash[:alert] = "Sign In"
			redirect_to login_path
			return
		end
		@user = current_user
		@user_cards = @user.cards
		@allcards = Card.all
	end

	def remove
		@user = current_user
		@card = Card.find(params[:id])
		@user.cards.destroy(@card)
		redirect_to cards_path
	end

	def add
		@user = current_user
		@card = Card.find(params[:id])
		@user.cards << @card
		redirect_to cards_path
	end


	def new
		@user = current_user
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
			flash[:alert] = "Your card info is updated"
			redirect_to card_path(@card.id)
		else
			render :edit
		end
	end

	def show
		@user = current_user
		session[:user_id] = @user.id
		@card = Card.find(params[:id])
	end

	# def destroy
	# 	@card = Card.find(params[:id])
	# 	flash[:alert] = "This credit card is removed."
	# 	@card.destroy
	# 	session[:user_id] = @user.id
	# 	redirect_to user_path(@user.id)
	# end

	private
	def card_params
		params.require(:card).permit(:cardnum, :cardtype, :expire_m, :expire_y)
	end


end
