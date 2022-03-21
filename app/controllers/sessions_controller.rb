class SessionsController < ApplicationController
    def new
        @User = User.new
    end

    def create
        @User = User.find_by(email: user_params[:email])

        if @user && @User.ispassword?(user_params[:password])
            session[:user_id] = @User.id
            #redirect to somewhere
        else
            flash.now[:notice] = "Invalid login or password provided"
            render :new
        end
        
    end
end
