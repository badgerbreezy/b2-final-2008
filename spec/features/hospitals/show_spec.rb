require 'rails_helper'

RSpec.describe 'As visitor when I visit a hospital show page' do
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
  it 'I see the hospitals name, doctors, and universities doctors have attended' do
    visit "/hospitals/#{@hospital.id}"
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content("Number of Doctors: #{@hospital.doctors.count}")
    expect(page).to have_content(@doctor_grey.university)
    expect(page).to have_content(@doctor_karev.university, count: 1)
  end
end
