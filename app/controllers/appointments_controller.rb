class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new(appointment_params)
  end

  def index
    @appointments = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
  end

  private

   def appointment_params
     params.require(:appointment).permit(:doctor_id, :patient_id, :time, :date, :notes)
   end
end
