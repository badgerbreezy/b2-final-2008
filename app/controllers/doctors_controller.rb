class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    binding.pry
    @patient = @doctor.patients.find(params[:patient_id])
    @patient_doctor = @patient.doctors.find(params[:id])
    @patient_doctor.(doctor_id: nil)
    redirect_to "/doctors/#{@doctor.id}"
  end
end
