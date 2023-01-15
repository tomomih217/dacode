class AnswersController < ApplicationController
  layout 'levels/layouts/application'
  skip_before_action :logout_guest
  before_action :get_level_id
  def new
    @answer = current_user.answers.build
    @quiz_id = params[:quiz_id]
    render "/levels/level#{@level_id}/#{params[:name]}"
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @quiz_id = params[:answer][:quiz_id]
    if @answer.currect_len?
      if @answer.save
        if @quiz_id.to_i < 8
          params[:name] = 'step1'
        elsif @quiz_id.to_i == 8
          params[:name] = 'step2'
        end
        @answers = current_user.answers
        render "/levels/level#{@level_id}/#{params[:name]}"
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
    render "/levels/level#{@level_id}/#{params[:name]}"
  end

  def update
    @answer = current_user.answers.find_by(quiz_id: params[:answer][:quiz_id])
    @quiz_id = params[:answer][:quiz_id]
    @answer.answer = params[:answer][:answer]
    if @answer.currect_len?
      if @answer.update(answer_params)
        if @quiz_id.to_i < 8
          params[:name] = 'step1'
        elsif @quiz_id.to_i == 8
          params[:name] = 'step2'
        end
        @answers = current_user.answers
        render "/levels/level#{@level_id}/#{params[:name]}"
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
    render "/levels/level#{@level_id}/#{params[:name]}"
  end

  def get_level_id
    @level_id = params[:level_id]
  end
end
