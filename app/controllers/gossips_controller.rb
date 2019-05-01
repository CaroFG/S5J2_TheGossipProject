class GossipsController < ApplicationController
  def index
    @gossip = Gossip.all
  end

  def show
    @gossip_precis = Gossip.find(params[:id])
    @gossip_user_id = @gossip_precis.user_id
    @gossip_user_city_id = User.find(@gossip_user_id).city_id
    @gossip_user_city = City.find(@gossip_user_city_id).name
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

  def edit
    @gossip_precis = Gossip.find(params[:id])
  end

  def update
    @gossip_precis = Gossip.find(params[:id])

    if @gossip_precis.update(gossip_params)
      redirect_to action:'index'
      flash[:success] = "Your gossip has been edited with success, my coño friend!"
    else
      flash[:alert] = "Try again, my coño friend!"
      render :edit

    end
  end


private

def gossip_params

  params.require(:gossip).permit(:title, :content)

end


end
