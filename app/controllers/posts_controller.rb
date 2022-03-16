class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  def show
    render json: @post, status: :ok
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { erros: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    unless @post.update(post_params)
      render json: {erros: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
