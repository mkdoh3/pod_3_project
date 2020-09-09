# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]
  include AppointmentsHelper

  def index
    @appointments = if params[:patient_id]
                      Appointment.where(patient_id: params[:patient_id])
                    else
                      Appointment.all
                    end
  end

  def show; end

  def new
    @patient = Patient.find_by_id(params[:patient_id]) if params[:patient_id]
    @appointment = Appointment.new
  end

  def edit; end

  def create
    #   byebug
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render 'new'
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:time, :date, :notes, :doctor_id, :patient_id, patient_attributes: %i[name age phone_number address])
  end
end
