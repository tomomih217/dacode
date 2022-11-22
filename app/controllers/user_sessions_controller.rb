class UserSessionsController < ApplicationController
    def new; end

    def create
        @user = login(params[:email], params[:password])
        if @user
            redirect_back_or_to root_url
        else
            render :new
        end
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
