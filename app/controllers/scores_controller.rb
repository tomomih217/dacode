class ScoresController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @lv1_records = Record.where("status = '2' AND level_id = '1'").includes(:user).order('(updated_at - created_at) asc')
    @lv2_records = Record.where("status = '2' AND level_id = '2'").includes(:user).order('(updated_at - created_at) asc')
  end

  def show
    @record = Record.find(params[:id])
  end

  def myscore
    @myrecords = current_user.records
  end
end
