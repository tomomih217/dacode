class StepsController < ApplicationController
  layout 'levels/layouts/application'
  skip_before_action :require_login
  skip_before_action :logout_guest
  # 各ステップの表示
  def show
    @answers = current_user.answers
    level_id = params[:level_id]
    render "levels/level#{level_id}/step#{params[:id]}"
  end

  # イントロダクションの表示
  def introduction
    level_id = params[:level_id]
    render "levels/level#{level_id}/introduction"
  end
end