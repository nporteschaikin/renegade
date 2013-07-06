module CommentHelper
	
	def comment_tree(c)
		c.each do |comment|
			comment.comments = c.keep_if{|c| c.in_reply_to_id == comment.id}
		end
		c.keep_if{|c| c.in_reply_to_id == 0}
	end
	
end