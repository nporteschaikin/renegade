class UsersController < ApplicationController
	
	before_filter { |r| @user = User.find(params[:id]); r.redirect_incorrect_user @user }, only: [:edit, :update]
	
	def new; @user = User.new(params[:user]); end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to items_link_path(@link)
		else
			render 'new'
		end
	end
	
	def edit; end
	
	def update
		@user.update_attributes(params[:link])
		redirect_to user_path(@user)
	end
	
	def show; @user = User.find(params[:id]); end
		
end