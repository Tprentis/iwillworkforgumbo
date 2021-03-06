class AssetsController < ApplicationController

  def destroy
    @asset = Asset.find(params[:id])
    @asset.image = nil
    @asset.save
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to :back}
      format.json { head :no_content }
    end
  end

end
