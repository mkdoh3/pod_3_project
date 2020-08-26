# https://github.com/mkdoh3/pod_3_project/blob/master/app/views/patients/index.html.erb


# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end
  def show
    # will have a template in views/show.html file
   end
 
   def new
     #display form for user
     # will have a template in views/new.html file
     @patient = Patient.new
   end
 
   def create
     #save new record
     # will not have a template in views
     #but will save and redirect
     @patient = Patient.new(allowed_params)
    if @patient.save
      redirect_to patients_path
    else
      render 'new'
    end
   end
 
   def edit
     #display form for existing record
   # will have a template in views/edit.html file
   @patient = Patient.find(params[:id])
   end
 
   def update
     #update form for existing record
     # will save and redirect
     @patient = Patient.find(params[:id])
    if @patient.update_attributes(allowed_params)
      redirect_to patients_path
    else
      render 'new'
    end
   end
 
   def destroy
    # will destroy and redirect
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
   end

   private 
   def allowed_params
     params.require(:patient).permit(:name, :age, :phone_number, :address)
   end 
end
