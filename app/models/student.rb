class Student < ActiveRecord::Base
  has_many :classrooms

  validates :name, presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }

  has_enumeration_for :status, required: true
end
