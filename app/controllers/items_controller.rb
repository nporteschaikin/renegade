class ItemsController < ApplicationController
	
	def show; @item = Item.find_and_visit(params[:id], request); end
	
end