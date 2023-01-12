class RecordsController < ApplicationController
  skip_before_action :require_login
  # タイム計測スタート
  def create
    record = current_user.records.build(level_id: params[:id])
    if record.save
      params[:name] = "lv#{params[:id]}_introduction"
      path = "/levels/#{params[:id]}/steps/#{params[:name]}"
      redirect_to path
    else
      redirect_to levels_path, danger: t('defaults.message.already_game')
    end
  end

  # タイム計測ストップ
  def update
    @record = current_user.records.find(params[:id])
    @record.change_status(params[:commit])
    redirect_to score_path(@record), success: t('defaults.message.finish_game')
  end
end
