class UsersController < ApplicationController
	#note: put the def current_user in applications_controller
	
	# def index
	# 	 @users = User.all
	# end

	def new
		@user = User.new
	end

	def create   
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
		else
			flash[:error] = @user.errors.full_messages.to_sentence
			render :new
		end	
	end

	def edit
		@user = current_user
		session[:user_id]
	end

	def update
		@user = current_user
		session[:user_id]
		if 	@user.update(user_params)
			redirect_to user_path
		else
			render :edit
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		flash[:alert] = "Your account is deleted."
		@user.destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:fname, :lname, :email, :phone, :cash_bal)
	end
end


