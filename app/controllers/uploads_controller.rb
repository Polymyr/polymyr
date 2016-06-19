class UploadsController < ApplicationController
  
  def new
  	@upload = Upload.new
  end

  def create
  	@product = Product.find(params[:product_id])
  	@upload = @product.uploads.create(upload_params)
  	if @upload.save
  	  render json: { message: "success", fileID: @upload.id }, :status => 200
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
  	end  		
  end

  def destroy
    @upload = Upload.find(params[:id])
    if @upload.destroy    
      render json: { message: "File deleted from server" }
    else
      render json: { message: @upload.errors.full_messages.join(',') }
    end
  end

  private

	  def upload_params
	  	params.require(:upload).permit(:image)
	  end
end