class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end
    
    def index 
        @users = User.all
        render :index
    end

    def create
    end

    def show
    end

    def edit 
    end
    def update 
    end

    def destroy
    end



    private
    def user_params
        params.require(:user).permit(:email,:password)
    end

end
