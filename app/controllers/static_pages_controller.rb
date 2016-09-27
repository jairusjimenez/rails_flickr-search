class StaticPagesController < ApplicationController
	def index
		unless params[:user_id].nil?
			@user_id = params[:user_id]
		end
	end
end