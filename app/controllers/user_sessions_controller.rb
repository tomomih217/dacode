class UserSessionsController < ApplicationController
    skip_before_action :require_login

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
        logout
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
