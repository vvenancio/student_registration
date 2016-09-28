require 'rails_helper'

RSpec.describe Classroom, type: :model do
  subject { build(:classroom) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:student_id) }
    it { is_expected.to validate_presence_of(:course_id) }
    it { is_expected.to validate_uniqueness_of(:student_id).scoped_to(:course_id) }
    it { is_expected.to validate_presence_of(:entry_at) }
  end

  context 'with associations' do
    it { is_expected.to belong_to(:student) }
    it { is_expected.to belong_to(:course) }
  end
end
