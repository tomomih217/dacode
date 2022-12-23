class Levels::Level1Controller < ApplicationController
  before_action :set_level

  def introduction ;end

  def step1
    set_record
  end

  private

  def set_level
    @level = Level.find(params[:level_id])
  end

  def set_record
    @record = current_user.records.find_by(level_id: @level.id)
  end
end
