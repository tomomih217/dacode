class AnswersController < ApplicationController
  def new
    @answer = current_user.answers.build
    @quiz_id = params[:quiz_id]
    render "/levels/steps/lv1_quiz#{params[:quiz_id]}"
  end

  def create
    @answer = current_user.answers.build(answer_params)
    binding.pry
    if @answer.save(answer_params)
      params[:name] = 'lv1_step1'
      redirect_to '/levels/1/steps/lv1_step1'
    else
      flash.now[:danger] = 'Answer failed.'
      render "/levels/steps/#{params[:name]}"
    end
  end

  def edit
    @answer = current_user.answers.find_by(quiz_id: params[:quiz_id])
    @quiz_id = params[:quiz_id]
    render "/levels/steps/lv1_quiz#{params[:quiz_id]}"
  end

  def update
    @answer = current_user.answers.find_by(quiz_id: params[:answer][:quiz_id])
    if @answer.update(answer_params)
      params[:name] = 'lv1_step1'
      redirect_to '/levels/1/steps/lv1_step1'
    else
      flash.now[:danger] = 'Answer failed.'
      render "/levels/steps/#{params[:name]}"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :quiz_id)
  end
end
