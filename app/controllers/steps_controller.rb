class StepsController < ApplicationController
  layout 'levels/layouts/application'
  skip_before_action :require_login
  skip_before_action :logout_guest
  # 各ステップの表示
  def show
    @answers = current_user.answers
  end

  # イントロダクションの表示
  def introduction; end
end