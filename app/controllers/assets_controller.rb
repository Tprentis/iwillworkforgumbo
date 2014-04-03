class AssetsController < ApplicationController

  def destroy
    @asset = Asset.find(params[:id])
    @asset.image = nil
    @asset.save
    @asset.destroy
    @job.assets.reload
    respond_to do |format|
      format.html { redirect_to job_assets_path }
      format.json { head :no_content }
    end
  end

end
