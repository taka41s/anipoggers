class SessionsController < ApplicationController
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(login: user_params[:login])

        if @user && @user.is_password(user_params[:password])
            session[:user_id] = @user.id
            redirect_to '/videos/new'
        else
            flash.now[:notice] = "Invalid login or password provided"
            render :login
        end
        
    end


    private 
    def user_params
        params.require(:user).permit(:login, :password)
    end
end
