class Doctor < ApplicationRecord
  has_many :patients
  belongs_to :hospital

  validates_presence_of :name
  validates_presence_of :specialty
  validates_presence_of :university
end
