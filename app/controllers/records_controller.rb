class RecordsController < ApplicationController
  skip_before_action :require_login, only: %i[create]
  skip_before_action :logout_guest, only: %i[update]
  # タイム計測スタート
  def create
    if current_user.present?
      record = current_user.records.build(level_id: params[:id])
    elsif params[:id] == '1'
      user = User.create_guest_user
      guest_user = login(user.username, 'guest')
      record = guest_user.records.build(level_id: params[:id])
      record.status = 3
    end
    if record.save
      redirect_to level_introduction_path(params[:id])
    else
      record = current_user.records.find_by(level_id: params[:id])
      if record && record.challenge?
        redirect_to level_introduction_path(params[:id])
      else
        logout if logged_in?
        redirect_to levels_path, danger: t('defaults.message.already_game')
      end
    end
  end

  # タイム計測ストップ
  def update
    @record = current_user.records.find(params[:id])
    @record.change_status(params[:commit])
    redirect_to score_path(@record), success: t('defaults.message.finish_game')
  end
end
