class UsersController < ApplicationController
    def new 
        @user = User.new
        render :register
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render :register
        end
    end
    
    private

        def user_params
            params.require(:user).permit(:name, :email, :login, :password)
        end
end
