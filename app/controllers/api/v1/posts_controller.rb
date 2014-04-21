class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all.order(id: :desc)
    @total = @posts.count
    @posts = @posts.page(params[:page]).per(params[:per]).decorate
  end

  def show
    decorate_post
  end

  def create
    @post = Post.new post_params.merge({user_id: current_user.id})
    if @post.save
      decorate_post
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update post_params
      decorate_post
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private
    def set_post
      @post = Post.find params[:id]
    end

    def decorate_post
      @post =  PostDecorator.decorate @post
    end

    def post_params
      params.require(:post).permit(:full_text, :title,:preview, :category_id)
    end
end
