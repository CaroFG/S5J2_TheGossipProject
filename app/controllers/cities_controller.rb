class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
    @city_users = @city.users
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end
end
