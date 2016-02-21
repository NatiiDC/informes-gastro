class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]

  def patient_choice
    @patients = Patient.all
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

    @patient = @inspection.patient
  end

  # GET /inspections/new
  def new
    @patient = Patient.find(params['patient_id'])
    @inspection = Inspection.new
  end

  # GET /inspections/1/edit
  def edit
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
          :report,
          :conclusion,
          :diagnostic,
          :stomach,
          :esophagus,
          :duodenum)
    end
end
