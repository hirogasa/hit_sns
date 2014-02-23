# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_id 1
    name "MyString"
    email "MyString"
    grade 1
    department "MyString"
    comment "MyString"
  end
end
