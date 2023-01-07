class StepsController < ApplicationController
  skip_before_action :require_login
  # 各ステップの表示
  def show
    render "levels/steps/#{params[:name]}"
  end

  def new
  end

  def create
    render "levels/steps/#{params[:name]}"
  end
end