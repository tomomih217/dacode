class StepsController < ApplicationController
  skip_before_action :require_login
  # 導入部の表示
  def show
    render "levels/steps/#{params[:name]}"
  end
end