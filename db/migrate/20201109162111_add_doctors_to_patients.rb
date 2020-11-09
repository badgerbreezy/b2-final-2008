class AddDoctorsToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :doctor, foreign_key: true
  end
end
