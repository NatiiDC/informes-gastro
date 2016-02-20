class ImagesController < ApplicationController

  def create
    @inspection = Inspection.find(params['inspection_id'])

    # PROBLEMAS AL GUARDAR LA IMAGEN

    @image = @inspection.images.new(
      {"name" => params["image"]["name"]},
      {"data" => params["image"]["data"].read},
      {"filename" => params["image"]["data"].original_filename},
      {"mime_type" => params["image"]["data"].content_type})

    # @image = @inspection.images.new(params[:image]) do |t|
    #   if params[:image][:data]
    #     t.data      = params[:image][:data].read
    #     t.filename  = params[:image][:data].original_filename
    #     t.mime_type = params[:image][:data].content_type
    #   end
    # end

    if @image.save
      redirect_to :back, notice: 'La imagen se ha guardado'
    else
      render :back
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to :back
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params
        .require(:inspection)
        .permit(
          :name,
          :data,
          :filename,
          :mime_type)
    end


end
