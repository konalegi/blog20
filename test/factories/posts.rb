# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    text "MyString"
    title "MyString"
    category_id 1
  end
end
