module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :destroy]

      # GET /posts
      def index
        if params[:q].present?
          @posts = Post.ransack(params[:q]).result(distinct: true)
        else
          @posts = Post.all
        end
        
        @posts = @posts.map{ |post| Api::V1::PostSerializer.call(post) }

        render json: @posts, status: :ok
      end

      # GET /posts/:id
      def show
        render json: @post, status: :ok
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.valid? 
          @post.save
          render json: @post, status: :created
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /posts/:id
      def update
        unless @post.update(post_params)
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /posts/:id
      def destroy
        @post.destroy
      end

      private

      def post_params
        params.permit(:title, :content, :user_id, :category_id)
      end

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
