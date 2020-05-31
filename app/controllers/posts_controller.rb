class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        load_post
    end

    def new
        @post = Post.new
    end

    def create 
        @post = Post.new(post_params)
        @post.save
        redirect_to :show
    end

    def edit
        load_post
    end

    def update
        load_post
        @post.update(post_params)
        redirect_to :show
    end

    def delete
        load_post
        unless(@post.nil?)
            @post.destroy
        end
        redirect_to :main_page
    end

    def new_comment
        form_data = params.require(:comment).permit(:id, :text)

        @com = Comment.new(form_data)
        @com.user = User.where(id: session[:user_id]).first
        @com.post = Post.find(params[:id])
        @com.save
        
        puts @com 
        puts "-----------"
        puts form_data.inspect
        puts "-----------"
        puts @com.inspect
        puts @com.errors
        redirect_to request.referrer
    end



    private
    def post_params
        params.require(:post).permit(:title, :text)
    end

    def load_post
        @p = Post.where(id: params[:id])
        unless(@p.empty?)
            @post = Post.find(params[:id])
        end
    end
end
