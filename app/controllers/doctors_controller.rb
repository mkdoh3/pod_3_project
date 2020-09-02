class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def new
    @doctor = Doctor.new(doctor_params)
  end

  def index
    @doctors = Doctor.all
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      @errors = @doctor.errors.full_messages
      render "new"
    end
  end

  def show
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render "edit"
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url
  end


  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:user_name)
  end
end
