class AnswersController < ApplicationController
  def new ;end

  def create
    @answer = current_user.answers.build(level_id: 1, quiz_id: params[:quiz_id])
    @answer.answer = params[:answer]
    if @answer.save
      params[:name] = 'lv1_step1'
      redirect_to '/levels/1/steps/lv1_step1'
    end
  end
end
