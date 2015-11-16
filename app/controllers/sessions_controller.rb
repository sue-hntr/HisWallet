class SessionsController < ApplicationController
	#note: put the def current_user in applications_controller

def new
	@user = User.new
end

def create
	user_info = params[:user]
	ulname = user_info[:lname]
	uemail = user_info[:email]
	 @user = User.where(lname: ulname).first
	 if @user == nil
	 	flash[:alert] = "Not on list. Please sign up."
	 	redirect_to new_user_path
	 elsif @user.email != uemail
		flash[:alert] = "Lastname/Email mismatch. Please try again."
	    redirect_to login_path
	else
		session[:user_id] = @user.id
		puts "USER ID IS #{session[:user_id]}"
		redirect_to user_path(@user.id)
		return
	 end
end

def destroy
	flash[:alert] = "You are signed out."
	session[:user_id] = nil
	redirect_to root_path
end


end
