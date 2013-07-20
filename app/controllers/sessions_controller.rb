class SessionsController < ApplicationController
	
	before_filter :guest_user, only: [:new, :create]
	before_filter :signed_in_user, only: [:destroy]
	
	def new; end
	
	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or root_path
		else
			flash.now[:error] = 'Invalid email or password.'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to in_path
	end
	
end