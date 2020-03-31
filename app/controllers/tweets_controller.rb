class TweetsController < ApplicationController
before_action :authenticate_user!, except: [:index]  

  def index
    @comments = Comment.all.order(id: "DESC").page(params[:page]).per(5)
  end

  def new
  end
  
  def create
    Comment.create(text: comment_params[:text],user_id: current_user.id)
  end
  
  private
  def comment_params
    params.permit(:text)
  end  

end