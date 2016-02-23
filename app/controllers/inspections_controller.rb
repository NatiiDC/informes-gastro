class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]

  def patient_choice
    if params["name"].nil? || params["name"].blank?
      @patients = Patient.select(:id,:firstname,:lastname).page params[:page]
    else
      @name = params['name']
      @patients = Patient
          .select(:id,:firstname,:lastname)
          .where("firstname LIKE ? OR lastname LIKE ?", %Q{%#{@name}%}, %Q{%#{@name}%})
          .order("lastname ASC").page params[:page]

    end
  end

  def new_image

  end

  # GET /inspections
  def index
    @patient = Patient.find(params["patient_id"])
    @inspections = @patient.inspections
  end

  # GET /inspections/1
  def show
    @images = @inspection.images
    @patient = @inspection.patient
  end

  # GET /inspections/new
  def new
    @patient = Patient.find(params['patient_id'])
    @inspection = Inspection.new
  end

  # GET /inspections/1/edit
  def edit
    @images = @inspection.images
  end

  # POST /inspections
  def create
    @patient = Patient.find(params['patient_id'])
    @inspection = @patient.inspections.new(inspection_params)
    if @inspection.save
      redirect_to @inspection, notice: 'El informe se ha creado'
    else
      render :new
    end
  end

  # PATCH/PUT /inspections/1
  def update
    if @inspection.update(inspection_params)
      redirect_to @inspection, notice: 'El informe se ha actualizado'
    else
      render :edit
    end
  end

  # DELETE /inspections/1
  def destroy
    @inspection.destroy
    redirect_to inspections_url, notice: 'El informe se ha eliminado'
  end

  private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_params
      params
        .require(:inspection)
        .permit(
          :patient_id,
          :study_of_name,
          :study_of_type,
          :date,
          :reason,
          :conclusion,
          :diagnostic,
          :stomach,
          :esophagus,
          :duodenum,
          :colonoscopy,
          :rectal_examination)
    end
end
