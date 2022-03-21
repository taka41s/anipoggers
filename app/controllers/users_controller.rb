class UsersController < ApplicationController
    def new 
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @User.save
            #render somewhere
        end
    end


    private

        def user_params
            params.require(:user).permit(:email, :name, login:, :password)
        end
end
