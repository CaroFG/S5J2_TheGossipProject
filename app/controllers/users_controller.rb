class UsersController < ApplicationController

	def show
		@user_precis = User.find(params[:id])
	end


end