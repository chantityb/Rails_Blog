class PostsController < ApplicationController
 
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
   

  # GET /posts
   def index
        @posts = Post.all.order("created_at DESC")
    end

    # GET /posts/new
    def new
        @post = current_user.posts.build
    end

    # POST /posts.
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] =  "The post was successfully created!"
            redirect_to @post
        else
            render 'new'
        end
    end

    # GET /posts/1
    def show
    end

    # PATCH/PUT /posts/1
    def update
		if @post.update(post_params)
            flash[:success] = "Update successful!"
            redirect_to @post
        else
            render 'edit'
        end
    end

    # GET /posts/1/edit
    def edit
    end

    # DELETE /posts/1
    def destroy
        @post.destroy
        flash[:danger] = "Post destroyed"
		redirect_to posts_path 

    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end

    def find_post
     	@post = Post.find(params[:id])
	end
end
