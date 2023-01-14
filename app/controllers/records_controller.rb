class RecordsController < ApplicationController
  skip_before_action :require_login, only: %i[create]
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
      params[:name] = "lv#{params[:id]}_introduction"
      path = "/levels/#{params[:id]}/steps/#{params[:name]}"
      redirect_to path
    else
      record = current_user.records.find_by(level_id: params[:id])
      if record && record.challenge?
        params[:name] = "lv#{params[:id]}_step1"
        path = "/levels/#{params[:id]}/steps/#{params[:name]}"
        redirect_to path
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
