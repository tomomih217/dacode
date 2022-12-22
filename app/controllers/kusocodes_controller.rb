class KusocodesController < ApplicationController
  skip_before_action :require_login, only: %i[index new]
  def index
    @kusocodes = Kusocode.all.includes(:user).order(created_at: :desc)
  end

  def new
    @kusocode = Kusocode.new
  end

  def create
    @kusocode = current_user.kusocodes.build(kusocode_params)
    if @kusocode.save
      redirect_to kusocodes_path, success: t('defaults.message.created', item: Kusocode.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Kusocode.model_name.human)
      render :new
    end
  end

  def destroy
  end

  private

  def kusocode_params
    params.require(:kusocode).permit(:code, :description)
  end
end
