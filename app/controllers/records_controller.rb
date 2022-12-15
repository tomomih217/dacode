class RecordsController < ApplicationController
  # タイム計測スタート
  def create
    record = current_user.records.build(level_id: params[:id])
    if record.save
      redirect_to level_introduction_path(params[:id])
    else
      redirect_to levels_path, danger: t('defaults.message.already_game')
    end
  end

  # タイム計測ストップ
  def update
    record = current_user.records.find(params[:id])
    record.change_status(params[:commit])
    redirect_to root_path, success: t('defaults.message.finish_game')
  end
end
