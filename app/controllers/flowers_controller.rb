class FlowersController < ApplicationController
  def create
    @kusocode = Kusocode.find(params[:kusocode_id])
    current_user.flowered(@kusocode)
  end
  
  def destroy
    @kusocode = Flower.find(params[:id]).kusocode
    current_user.unflowered(@kusocode)
  end
end