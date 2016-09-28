class Course < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 45 }

  has_enumeration_for :status, required: true
end
