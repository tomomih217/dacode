class RecordsController < ApplicationController
  # タイム計測スタート
  def create
    record = current_user.records.build(level_id: params[:id])
    record.save!
    redirect_to root_path
  end

  def edit ;end

  def update
    record = current_user.records.find_by(level_id: params[:id])
    record.status = 1
    record.update
  end
end
