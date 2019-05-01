class UsersController < ApplicationController

	def show
		@user_precis = User.find(params[:id])
		@user_city_id = @user_precis.city_id
		@user_city = City.find(@user_city_id).name
	end


end