class ScoresController < ApplicationController
  def index
    @records = Record.where("status = '2'").includes(:user).order('(updated_at - created_at) asc')
  end

  def show
    @record = Record.find(params[:id])
  end
end
