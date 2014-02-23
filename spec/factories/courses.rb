# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    day "MyString"
    period 1
    teacher "MyString"
    memo "MyString"
  end
end
