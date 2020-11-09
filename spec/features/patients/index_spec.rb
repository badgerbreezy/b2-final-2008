require 'rails_helper'

RSpec.describe 'As visitor when I visit the patient index page' do
# |---------->|setup|<----------|
  before :each do
    @hospital = Hospital.create!(
      name: 'Grey Sloan Memorial Hospital'
    )
    @doctor_grey = Doctor.create!(
      name: 'Meredith Grey',
      specialty: 'General Surgery',
      university: 'Harvard University',
      hospital: @hospital
    )
    @doctor_karev = Doctor.create!(
      name: 'Alex Karev',
      specialty: 'Pediatric Surgery',
      university: 'Johns Hopkins University',
      hospital: @hospital
    )
    @doctor_bailey = Doctor.create!(
      name: 'Miranda Bailey',
      specialty: 'Psychiatric Health',
      university: 'Johns Hopkins University',
      hospital: @hospital
    )
    @patient_1 = @doctor_grey.patients.create!(
      name: 'Katie Bryce',
      age: 24,
      # doctor: @doctor_grey
    )
    @patient_2 = @doctor_grey.patients.create!(
      name: 'Denny Duquette',
      age: 39,
      # doctor: @doctor_grey
    )
    @patient_3 = @doctor_grey.patients.create!(
      name: 'Rebecca Pope',
      age: 32,
      # doctor: @doctor_grey
    )
    @patient_4 = @doctor_karev.patients.create!(
      name: 'Zola Shephard',
      age: 2,
      # doctor: @doctor_karev
    )
    DoctorPatient.create!(patient: @patient_1, doctor: @doctor_grey)
    DoctorPatient.create!(patient: @patient_2, doctor: @doctor_grey)
    DoctorPatient.create!(patient: @patient_3, doctor: @doctor_grey)
    DoctorPatient.create!(patient: @patient_4, doctor: @doctor_karev)
  end
# |---------->|tests|<----------|
  it 'I see all patients listed from oldest to youngest' do
    visit "/patients"
    within "#patient-#{@patient_1.id}" do
      expect(page).to have_content(@patient_1.name)
    end

    within "#patient-#{@patient_2.id}" do
      expect(page).to have_content(@patient_2.age)
    end

    within "#patient-#{@patient_3.id}" do
      expect(page).to have_content(@patient_3.doctor.name)
    end

    within "#patient-#{@patient_4.id}" do
      expect(page).to have_content(@patient_4.name)
    end
  end
end
