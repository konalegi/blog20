# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    surname "MyString"
    birthdate "2014-04-19"
    role ""
    password_digest "MyString"
  end
end
