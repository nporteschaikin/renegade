class CommentsController < ApplicationController
	
	def reply
		@comment = Comment.find(params[:id])
		@parent = @comment.commented
		@child = Comment.new in_reply_to: @comment
		respond_to do |f|
			f.js { render layout: false }
			f.html
		end
	end
	
	def index; @comments = comment_tree(commented.comments); end
	
	def create
		@comment = commented.comments.create comment_params.merge!(user: current_user)
		respond_to do |f|
			f.js { render layout: false }
			f.html
		end
	end
	
	private 
	
		def comment_params
			params.require(:comment).permit(:in_reply_to_id, :comment)
		end
		
		def commented
			params.each do |name, value|
				puts name
				if name =~ /(.+)_id$/
					return $1.classify.constantize.find value
				end
			end
		end
	
end