class GoalsController < ApplicationController
    def new
        @goal = Goal.new
        render :new
    end
    def index
        @goals= Goal.all
        render :index
    end

    def show
        @goal = Goal.find_by(user_id: params[:user_id])
        render :show
    end

    def edit
        @goal = Goal.find_by(id: params[:id])
        render :edit
    end

    # def create
    #     @goal = Goal.new(goal_params)
    #     if @goal.save
            
    #         redirect_to user_url(@goal)
    #     else
    #         flash.now[:errors] =  @goal.errors.full_messages
    #         render :new
    #     end
    # end



    
    # def update
    #     @goal = Goal.find_by(id: params[:id])
    #     if @goal.update(goal_params)
    #         redirect_to user_url(@goal)
    #     else
    #         render :edit
    #     end
    # end

    # def destroy
    #     @goal = Goal.find_by(id: params[:id])
    #     @goal.destroy
    #     redirect_to new_user
    # end

    private
    def goal_params
        params.require(:goal).permit(:name, :status, :user_id, :details)
    end


end
