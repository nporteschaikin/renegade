class UsersController < ApplicationController
	
	before_filter :correct_user, only: [:create, :edit, :update]
	
	def new; @user = User.new(params[:user]); end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to items_link_path(@link)
		else
			render 'new'
		end
	end
	
	def edit; @user = User.find(params[:id]); end
	
	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:link])
		redirect_to user_path(@user)
	end
	
	def show; @link = Link.find(params[:id]); end
		
end