class ItemsController < ApplicationController
	
	def show; @item = Item.find_and_impress(params[:id], request); end
	
end