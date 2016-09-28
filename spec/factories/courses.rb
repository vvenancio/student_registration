FactoryGirl.define do
  factory :course do
    name 'Biologia'
    description 'Anatomia dos seres humanos'
    status Status::ACTIVE
  end
end