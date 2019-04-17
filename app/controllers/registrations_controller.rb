class RegistrationsController < ApplicationController
	def new
	end

	def create
	    @registrations = User.new(registration_params)
	    if @registrations.save
	      flash[:notice] = "Successful registration"
	      redirect_to root_path
	    else
	      # This line overrides the default rendering behavior, which
	      # would have been to render the "create" view.
	      flash.now[:error] = "Could not register"
	      render "new"
    	end
	end

	def registration_params
  		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
