class ImagesController < ApplicationController

  def create
    @inspection = Inspection.find(params['inspection_id'])

    @next = true
    image_params["capture"].each do |capture|
      @image = @inspection.images.new({"name" => image_params["name"]})
      @image.capture = capture
      if ! @image.save
        @next = false
        break
      end
    end

    if @next
      redirect_to :back, notice: 'La/s imagen/es se ha/n guardado'
    else
      render :back
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to :back
  end

  def serve
    @image = Image.find(params[:id])
    send_data(@image.data, :type => @image.mime_type, :filename => "#{@image.name}.jpg", :disposition => "inline")
  end

  private
    def image_params
      params
        .require(:image)
        .permit(
          :name,
          {capture: []})
    end
end
