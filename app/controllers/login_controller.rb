class LoginController < ApplicationController
    def load
        render_default
    end

    def login
        @user = User.new(form_data)
        unless(@user.valid?)
            
            session[:error_msg] = 'Username/password are too short'
            render_default
            return
        end
        user = User.where(username: @user.username,  
                          password: @user.password).first

        unless(user.nil?)
            session[:user_id] = user.id
            @user = user
            redirect_to :main_page
        else
            session[:error_msg] = "Invalid username or password"
            render_default
            return
        end  
    end

    def logout
        session[:user_id] = nil
        redirect_to :main_page
    end

    private

    def form_data
        params.require(:user).permit(:username, :password)
    end

    def render_default
        render "login"
    end
end