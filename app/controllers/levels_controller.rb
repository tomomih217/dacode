class LevelsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  #ゲーム選択画面を出力
  def index
    @levels = Level.all
  end

  #ゲーム開始画面への遷移
  def show
  end
end
