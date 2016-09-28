FactoryGirl.define do
  factory :student do
    name 'Marco'
    register_number 'ABCDE10'
    status Status::ACTIVE
  end
end
