class StepsController < ApplicationController
  skip_before_action :require_login
  # 各ステップの表示
  def show
    @answers = current_user.answers
    render "levels/steps/#{params[:name]}"
  end
end