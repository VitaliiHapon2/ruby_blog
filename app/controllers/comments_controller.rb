class CommentsController < ApplicationController

    def make_comment
        form_data = params.require(:comment).permit(:id, :text)

        @com = Comment.new(form_data)
        @com.user = User.where(id: session[:user_id]).first
        @com.post_id = form_data[:id]
        @com.save
        
        puts @com 
        puts "-----------"
        puts form_data.inspect
        puts "-----------"
        puts @com.inspect
        puts @com.errors
        redirect_to request.referrer
    end

    def delete
        load_comment
        @comm.destroy
        redirect_to request.referrer
    end


    private
    def form_data      
        params.require(:comment).permit(:id, :text)
    end

    def load_comment
        @comm = Comment.find(params[:id])
    end


end
