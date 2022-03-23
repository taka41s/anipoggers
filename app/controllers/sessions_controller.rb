class SessionsController < ApplicationController
    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(login: user_params[:login])

        if @user && @user.is_password(user_params[:password])
            session[:user_id] = @user.id
            redirect_to '/videos'
        else
            flash.now[:notice] = "Invalid login or password provided"
            render :login
        end 
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out'
    end


    private 
    def user_params
        params.require(:user).permit(:login, :password)
    end
end
