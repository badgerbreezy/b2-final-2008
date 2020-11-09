class Patient < ApplicationRecord
  belongs_to :doctor

  validates_presence_of :name
  validates_presence_of :age
end
