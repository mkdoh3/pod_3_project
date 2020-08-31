# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
 
  def index
    @patients = Patient.all
  end

  def show 
  end

  def new
    @patient = Patient.new 
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params(:name, :phone_number, :age, :address))
    if @patient.save
      redirect_to @patient
    else  
      render "new"
    end 
  end

  def update
    if @patient.update(patient_params(:name, :phone_number, :age, :address))
      redirect_to @patient
    else  
      render "edit"
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url
  end

private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params(*args)
    params.require(:patient).permit(*args)
  end


end
