class AnswersController < ApplicationController
  def new
    @answer = current_user.answers.build
    @quiz_id = params[:quiz_id]
    render "/levels/steps/#{params[:name]}"
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @quiz_id = params[:answer][:quiz_id]
    if @answer.currect_len?
      if @answer.save
        if @quiz_id.to_i < 9
          params[:name] = 'lv1_step1'
        elsif @quiz_id.to_i == 9
          params[:name] = 'lv1_step3'
        end
        @answers = current_user.answers
        render "/levels/steps/#{params[:name]}"
      else
        redoing
      end
    else
      redoing
    end
  end

  def edit
    @answer = current_user.answers.find_by(quiz_id: params[:quiz_id])
    @quiz_id = params[:quiz_id]
    render "/levels/steps/#{params[:name]}"
  end

  def update
    @answer = current_user.answers.find_by(quiz_id: params[:answer][:quiz_id])
    @quiz_id = params[:answer][:quiz_id]
    @answer.answer = params[:answer][:answer]
    if @answer.currect_len?
      if @answer.update(answer_params)
        params[:name] = 'lv1_step1'
        @answers = current_user.answers
        redirect_to '/levels/1/steps/lv1_step1'
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
    flash.now[:danger] = 'failed'
    render "/levels/steps/#{params[:name]}"
  end
end