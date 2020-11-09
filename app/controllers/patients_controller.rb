class PatientsController < ApplicationController
  def index
    @patients = Patient.all.order(age: :desc)
  end
end
