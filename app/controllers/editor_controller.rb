class EditorController < ApplicationController
    def load
        render_default
    end

    def new
        @is_new = true
        render_default
             
    end

    def cancel_edit
        redirect_to :main_page
    end

    def update
       # @is_new = false
        #load_post
        #@post.update(post_params)
        #redirect_to :show
        
    end

    def save
        @post = Post.new  

        #@#is_new = false
        #l#oad_post
        #@post.update(post_params)
        #redirect_to :show
        
    end

    def edit
        @is_new = false
        load_post 
        render_default
    end

    private

    def form_data
        params.require(:user).permit(:username, :password)
    end

    def render_default
        render "editor"
    end

    def load_post
        unless(@is_new)
            @p = Post.where(id: params[:id])
            unless(@p.empty?)
                @post = Post.find(params[:id])
            end
        end
    end
end