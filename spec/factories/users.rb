# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    user_id 1
    name "John"
    email "John@world.com"
    grade 1
    department "MyString"
    comment "MyString"
		password "foobar"
		password_confirmation "foobar"
  end
end
