class AnswersController < ApplicationController
  layout 'levels/layouts/application'
  skip_before_action :logout_guest
  def new
    @answer = current_user.answers.build
    if params[:quiz_id].to_i < 8
      render "/levels/level#{params[:level_id]}/quiz"
    elsif params[:quiz_id].to_i == 8
      render "/levels/level#{params[:level_id]}/step#{params[:step_id]}"
    end
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.currect_len?
      if @answer.save
        if params[:quiz_id].to_i < 8
          path = level_step_path(params[:level_id], Settings.Level1[:step1])
        elsif params[:quiz_id].to_i == 8
          path = level_step_edit_answer_path(params[:level_id], Settings.Level1[:step2], params[:quiz_id])
        end
        redirect_to path
      else
        redoing
      end
    else
      redoing
    end
  end

  def edit
    @answer = current_user.answers.find_by(quiz_id: params[:quiz_id])
    if params[:quiz_id].to_i < 8
      render "/levels/level#{params[:level_id]}/quiz"
    elsif params[:quiz_id].to_i == 8
      render "/levels/level#{params[:level_id]}/step#{params[:step_id]}"
    end
  end

  def update
    @answer = current_user.answers.find_by(quiz_id: params[:quiz_id])
    @answer.answer = params[:answer][:answer]
    if @answer.currect_len?
      if @answer.update(answer_params)
        if params[:quiz_id].to_i < 8
          step_id = Settings.Level1[:step1].to_s
        elsif params[:quiz_id].to_i == 8
          step_id = Settings.Level1[:step2].to_s
        end
        redirect_to level_step_path(params[:level_id], step_id)
      else
        redoing
      end
    else
      redoing
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :quiz_id)
  end

  def redoing
    flash[:danger] = 'failed'
    redirect_to request.referer
  end
end
