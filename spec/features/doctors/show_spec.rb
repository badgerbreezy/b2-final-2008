require 'rails_helper'

RSpec.describe 'As visitor when I visit the doctor show page' do
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
    @patient_1 = Patient.create!(
      name: 'Katie Bryce',
      age: 24,
      doctor: @doctor_grey
    )
    @patient_2 = Patient.create!(
      name: 'Denny Duquette',
      age: 39,
      doctor: @doctor_grey
    )
    @patient_3 = Patient.create!(
      name: 'Rebecca Pope',
      age: 32,
      doctor: @doctor_grey
    )
    @patient_4 = Patient.create!(
      name: 'Zola Shephard',
      age: 2,
      doctor: @doctor_karev
    )
  end
# |---------->|tests|<----------|
  it 'I can see all the doctors information, hospital, and patients' do
    visit "/doctors/#{@doctor_grey.id}"
    expect(page).to have_content(@doctor_grey.name)
    expect(page).to have_content(@doctor_grey.specialty)
    expect(page).to have_content(@doctor_grey.university)
    expect(page).to have_content(@doctor_grey.hospital.name)
    expect(page).to have_content(@patient_1.name)
    expect(page).to have_content(@patient_2.name)
    expect(page).to have_content(@patient_3.name)
  end

  it 'I can remove a patient from the doctor' do
    visit "/doctors/#{@doctor_grey.id}"

    within "#patient-#{@patient_1.id}" do
      expect(page).to have_content(@patient_1.name)
      click_on 'Remove Patient'
    end

    expect(current_path).to eq("/doctors/#{@doctor_grey.id}")
    expect(page).to_not have_content(@patient_1.name)
  end
end
