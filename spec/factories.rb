FactoryGirl.define do
  factory :property, class: Holidays::Model::Property do
    id "MYTESTID"
    title  "My Test Title"
    address "My, Test, Address"
    property_type 2
    rate 36.59
    guests 3
    email "email@email.com"
    phone "+5555555"
    is_draft false
  end

  factory :property_as_draft, class: Holidays::Model::Property do
    id "MYTESTID"
    title  "My Test Title"
    is_draft true
  end
end
