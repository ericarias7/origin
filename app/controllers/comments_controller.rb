class CommentsController < ApplicationController

before_action :set_post

	def create 
		@comment = @post.comments.build(comment_params)
		@comment.user.id = current_user.id

		if 
			@comment.save
			flash [:success] = "You commented the hell out of that post!!"
			redirect_to :back

		else 
			flash[:alert] = "Check the comment form, something went horribly wrong."
	    	render root_path
	 	end
	def destroy 
		@comment = Post.comments.find(params[:id])
		
		@comment.destroy
		flash[:success] = "Comment deleted :("
		redirect_to root_path
	end 

private

	def comment_params
	  params.require(:comment).permit(:content)
	end

	def set_post
	  @post = Post.find(params[:post_id])
	end

end
