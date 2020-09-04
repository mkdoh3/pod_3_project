class AppointmentsController < ApplicationController

    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
    include AppointmentsHelper

    def index
        @appointments = Appointment.all
    end

    def show
    end

    def new
        @appointment = Appointment.new
    end

    def edit
    end

    def create
      byebug
        @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render "new"
        end
    end

    private

    def set_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:time, :date, :notes, :doctor_id, :patient_id, patient_attributes:[:name, :age, :phone_number, :address])
    end

end
