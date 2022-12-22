class FlowersController < ApplicationController
  def create
    kusocode = Kusocode.find(params[:kusocode_id])
    if current_user.flowered(kusocode)
      redirect_back fallback_location: kusocodes_path, success: 'flowered successfully.'
    end
  end
  
  def destroy
    kusocode = Flower.find(params[:id]).kusocode
    if current_user.unflowered(kusocode)
      redirect_back fallback_location: kusocodes_path, success: 'unflowered.'
    end
  end
end