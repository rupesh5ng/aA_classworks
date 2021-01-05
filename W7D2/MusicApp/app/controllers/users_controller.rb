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
        @user = User.create(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def edit 
        @user = User.find_by(id: params[:id])
        render :edit
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
