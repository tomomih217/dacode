class RecordsController < ApplicationController
  # タイム計測スタート
  def create
    record = current_user.records.build(level_id: params[:id])
    record.save!
    redirect_to level_introduction_path(params[:id])
  end

  # タイム計測ストップ
  def update
    record = current_user.records.find_by(level_id: params[:id])
    params[:commit] == 'クリア' ? status = 2 : status = 1
    record.update(status: status)
    redirect_to root_path
  end
end
