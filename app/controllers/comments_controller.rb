class CommentsController < ApplicationController

before_action :find_post, only: [:create, :edit, :update, :destroy]
before_action :find_comment, only: [:edit, :update, :destroy]
before_action :authenticate_user!

    

    def create
        #creates comment with respect to the post
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @comment.update(comment_params)
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to post_path(@post)
    end

private
    def comment_params
        params.require(:comment).permit(:comment)
        
    end

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_comment
        @comment = @post.comments.find(params[:id])
    end


end
