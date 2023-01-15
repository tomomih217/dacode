class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :logout_guest, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('defaults.message.created', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: User.model_name.human)
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.member! if @user.guest?
    if @user.update(user_params)
      redirect_to myscore_url
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
