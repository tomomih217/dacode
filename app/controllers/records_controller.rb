class RecordsController < ApplicationController
  # タイム計測スタート
  def create
    record = current_user.records.build(level: params[:level])
    record.save!
  end

  def update
  end
end
