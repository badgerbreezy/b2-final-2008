class HospitalsController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
    @universities = @hospital.doctors.select(:university).distinct
  end
end
