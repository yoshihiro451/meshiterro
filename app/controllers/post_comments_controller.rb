class PostCommentsController < ApplicationController
	def create
		post_image = PostImage.find(params[:post_image_id])
		comment = current_userpost_comments.new(post_comment_params)
		comment.post_image_id = post_image.id
		comment.save
		redirect_to post_image_path(post_image)
	end
end

private

def post_comment_params
	params.require(:post_comment).permit(:user_id,
		:post_image_id,
		:comment)
end
