#coding: utf-8
class CommentsController < ApplicationController


	def create
		@micropost = Micropost.find(params[:micropost_id])
		@comment = @micropost.comments.build(params[:comment])
		if @comment.save
			redirect_to micropost_path(@micropost)
		else
		 flash[:notice] = "没什么可说的就别说了呗!"
          redirect_to micropost_path(@micropost)
		end
	end

	def destroy
		@micropost = Micropost.find_by_id(params[:micropost_id])
		@comment = Comment.find_by_id(params[:id])
		@comment.destroy
		redirect_to micropost_path(@micropost)
	end
	
end