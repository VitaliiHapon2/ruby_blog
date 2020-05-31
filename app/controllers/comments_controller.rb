class CommentsController < ApplicationController

    def create 
        #@post = Post.new(post_params)
        #@post.save
        redirect_to : :main_page
    end

    def delete
        load_post
        @post.destroy
        redirect_to :index
    end


    private
    def post_params      
        params.require(:comment).permit(:id)
    end

    def load_post
        @post = Post.find(params[:id])
    end
end
