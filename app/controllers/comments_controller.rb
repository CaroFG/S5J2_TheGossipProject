class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end


  def show
    @gossip_id = Gossip.find(params['gossip_id']).id
    @comment = Comment.find_by(@gossip_id)
  end

  
  def new
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params['gossip_id']) 
    @anonymous = User.find_by(last_name: "Nymous")
    @anonymous_id = @anonymous.id
    @comment = Comment.new(content: params[:content], user_id: @anonymous_id, gossip_id: @gossip.id)
    @comment.save
    redirect_to gossip_path(@gossip.id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip_precis = Gossip.find(params[:gossip_id])
    @comment.save
    
    if @comment.update(content: params[:content])
      redirect_to gossip_path(@gossip_precis.id)
      flash[:success] = "Your comment has been edited with success, my coño friend!"
    else
      flash[:alert] = "Try again, my coño friend!"
      render :edit
    end





  def destroy
    @comment.destroy
  end

end

private

def comment_params

  params.require(:comment).permit(:content)

end


end
