class Classroom < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates :student_id, presence: true, uniqueness: { scope: :course_id }
  validates :course_id, presence: true
  validates :entry_at, presence: true
end
