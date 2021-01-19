class CommentsController < ApplicationController
  before_action :login_check, only: [:create,:destroy]
  
  def create
    radio = Radio.find(params[:radio_id])
    @comment = radio.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @radio = Radio.find(params[:radio_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
  

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end