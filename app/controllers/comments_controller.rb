class CommentsController < ApplicationController
	def index
		@micropost = current_user.microposts.find(params[:id])
		@comments = @micropost.comments
	end
end