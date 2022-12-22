class FlowersController < ApplicationController
  def create
    kusocode = Kusocode.find(params[:kusocode_id])
    if current_user.flowered(kusocode)
      redirect_back fallback_location: kusocodes_path, success: 'flowered successfully.'
    end
  end
  
  def destroy
  end
end