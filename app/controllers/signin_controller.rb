class SigninController < ApplicationController
    def load
        render_default
    end

    def signin
        @user = User.new(form_data)

        unless(@user.valid?)
            session[:error_msg] = 'Username and password must be from 3 up to 20 symbols '
            render_default
            return
        end

        unless(User.where(username: @user.username).empty?)
            session[:error_msg] = 'Username is already taken '    
            render_default
            return   
        end

        if(form_data[:password] == params[:user][:confirm])        
                @user.save
                session[:user_id] = @user.id
                redirect_to :main_page
        else
            session[:error_msg] = 'Passwords do not match '
            render_default
            return
        end
    end

    private

    def form_data
        params.require(:user).permit(:username, :password)
    end

    def render_default
        render "signin"
    end
end