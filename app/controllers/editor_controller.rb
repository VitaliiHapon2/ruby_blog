class EditorController < ApplicationController
    def load
        render_default
    end

    
    def new
        categories

        @is_new = true
        render_default
             
    end

    def cancel_edit
        redirect_to :main_page
    end

 

    def update
        @post = Post.find(params[:id])
        @data = form_data
        @post.update(params.require(:post).permit(:title, :description, :text))
        @post.category = Category.where(name:@data[:category]).first
        @post.user = User.find(session[:user_id])
        @post.save
        redirect_to :main_page      
    end

    def save
        @post = Post.new  
        @data = form_data
        @post.title = @data[:title]
        @post.description = @data[:description]
        @post.text = @data[:text]

        @post.category = Category.where(name:@data[:category]).first
        @post.user = User.find(session[:user_id])
        @post.save
        
        
        unless(@post.valid?)
            session[:error_msg] = @post.errors.full_messages    
            redirect_to request.referrer
        else
            redirect_to :main_page 
        end

        
    end

    def categories
        @arr = Array.new
        @all =  Category.all
        @all.each{ |a|
            @arr.push(a[:name])
        }
    end

    def edit
        categories
        
        @is_new = false
        load_post 
        render_default
    end

    private

    def form_data
        params.require(:post).permit(:title, :description, :text, :category)
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