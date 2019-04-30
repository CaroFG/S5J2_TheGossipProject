class GossipsController < ApplicationController
  def index
  @gossip = Gossip.all
  end

	def show
		@gossip_precis = Gossip.find(params[:id])
	end  

	def new
		@gossip_new = Gossip.new
	end

	def create
		anonymous = User.find_by(last_name: "Nymous")
    @gossip_new = Gossip.new(title: params[:title], content: params[:content], user: anonymous)
    @gossip_new.save

    if @gossip_new.save
    	redirect_to action:'index'
    	flash[:success] = "Your gossip has been registered with success, my coño friend!"
    else
    	render 'new'
    end

    puts @gossip_new.user 
	end


	
end
