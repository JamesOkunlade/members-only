class PostsController < ApplicationController
    include ApplicationHelper

    before_action :logged_in, only: [:new, :create]




    def index
        @posts = Post.all
        @users = User.all
    end 

    def new 
        @post = Post.new
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def create 
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            flash[:success] = "Post succesfully created!"
            redirect_to root_url
        else
            flash.now[:danger] = "Some problems prevented post from being created"
            render 'new'
        end
    end 


    private 

        def post_params 
            params.require(:post).permit(:title, :body)
        end 

        def logged_in
            unless logged_in?
              flash[:danger] = "Please login first!!!"
              redirect_to login_path
            end
        end

end
