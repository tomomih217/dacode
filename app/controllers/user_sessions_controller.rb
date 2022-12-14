class UserSessionsController < ApplicationController
    skip_before_action :require_login

    def new ;end

    def create
      @user = login(params[:username], params[:password])
      if @user
        redirect_back_or_to myscore_url, success: t('defaults.message.login')
      else
        flash.now[:danger] = t('defaults.message.not_login')
        render :new
      end
    end

    def destroy
      logout
      redirect_to root_url, success: t('defaults.message.logout')
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
