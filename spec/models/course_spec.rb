require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(45) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(45) }
    it { is_expected.to validate_presence_of(:status) }
  end

  context 'with association' do
    it { is_expected.to have_many(:classrooms) } 
  end  
end
