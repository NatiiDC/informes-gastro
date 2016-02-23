class ImagesController < ApplicationController

  def create
    @inspection = Inspection.find(params['inspection_id'])

    @next = true
    params["image"]["data"].each do |data|
      if @next
        @image = @inspection.images.new(
        "name" => params["image"]["name"],
        "data" => data.read,
        "filename" => data.original_filename,
        "mime_type" => data.content_type)
        @next = @image.save
      else
        break
      end
    end

    # @image = @inspection.images.new(
    # "name" => params["image"]["name"],
    # "data" => params["image"]["data"].read,
    # "filename" => params["image"]["data"].original_filename,
    # "mime_type" => params["image"]["data"].content_type)

    # @image = @inspection.images.new(params[:image]) do |t|
    #   if params[:image][:data]
    #     t.data      = params[:image][:data].read
    #     t.filename  = params[:image][:data].original_filename
    #     t.mime_type = params[:image][:data].content_type
    #   end
    # end

    # if @image.save
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
