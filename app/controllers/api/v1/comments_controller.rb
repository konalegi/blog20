class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]


  def index
    @comments =  Comment.all.where(:post_id => params[:post_id])
    @total = @comments.count
    @comments = @comments.decorate
  end

  def show
    decorate_comment
  end

  def create

    @comment = Comment.new comment_params.merge({post_id: params[:post_id], user: current_user})
    if @comment.save
      decorate_comment
      render :show, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update comment_params
      render :show, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def decorate_comment
      @comment = @comment.decorate
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
