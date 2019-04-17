class SessionsController < ApplicationController
	def new
		if current_user
			redirect_to current_user
		end
	end

	def create
		user = User.where(email: user_params[:email]).first
		puts user
		if user && user.password= user_params[:password]
	      # Save the user ID in the session so it can be used in
	      # subsequent requests
	      session[:current_user_id] = user.id
	      flash[:notice] = "You have successfully logged in."
	      redirect_to user
	    else
	    	flash[:error] = "You need to log in."
	    	redirect_to login
    	end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
    	flash[:notice] = "You have successfully logged out."
    	redirect_to root_path
	end

	def user_params
  		params.require(:session).permit(:name, :last_name, :email, :password, :phone)
	end
end
