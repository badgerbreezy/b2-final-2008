class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @patient = @doctor.patients.find(params[:patient_id])
    @patient.update(doctor_id: nil)
    redirect_to "/doctors/#{@doctor.id}"
  end
end
