class GossipsController < ApplicationController
  def index
  @gossip = Gossip.all
  puts @gossip
  end

	def show
		@gossip_precis = Gossip.find(params[:id])
	end  

	
end
