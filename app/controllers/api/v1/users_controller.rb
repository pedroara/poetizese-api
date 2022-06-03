module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: [:create]
      before_action :set_user, only: [:show, :destroy, :update]

      # GET /users
      def index
        @users = User.all
        render json: @users, status: :ok
      end

      # GET /users/:id
      def show
        render json: Api::V1::UserSerializer.call(@user), status: :ok
      end

      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { erros: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /users/:id
      def update
        
        unless @user.update(user_params)
          render json: {erros: @user.errors.full_messages}, status: :unprocessable_entity
        end

        @user.update(user_params)

        render json: Api::V1::UserSerializer.call(@user)
      end

      # DELETE /users/:id
      def destroy
        @user.destroy
      end

      private 

      def user_params
        params.permit(:username, :email, :password)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
