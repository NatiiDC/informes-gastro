class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  def index
    if ( params['name'].nil? || params['name'] == '' )
      # @invoices = @client.invoices.order("date_issue DESC").page params[:page]
      @patients = Patient.all.order("lastname ASC").page params[:page]
    else
      @name = params['name'].capitalize
      @patients = Patient.where("firstname = ? OR lastname = ?", @name, @name).order("lastname DESC").page params[:page]
    end
  end

  # GET /patients/1
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'El paciente se añadió' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patients/1
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Se actualizaron los datos correctamente' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params
        .require(:patient)
        .permit(
          :type_document_cd,
          :document_number,
          :firstname,
          :lastname,
          :observations,
          :birthdate,
          :nationality,
          :gender_cd,
          :obra_social_type,
          :obra_social_number,
          :phone)
    end
end
