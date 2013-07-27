#coding: utf-8
class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user,   only: :destroy


	def index
		if signed_in?
			@micropost  = current_user.microposts.build if signed_in?
			@feed_items = current_user.feed.paginate(page: params[:page])
		end
	end

	def show
		@micropost = Micropost.find_by_id(params[:id])
		@comment = @micropost.comments.build  #没和user挂钩，问题？
	end


	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end


	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private

	def correct_user
		@micropost = current_user.microposts.find_by_id(params[:id])
		redirect_to root_url if @micropost.nil?
	end


end
