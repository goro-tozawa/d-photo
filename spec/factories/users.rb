FactoryBot.define do
  factory :user do
    name                                       {"あああああ"}
    nickname                                       {"test"}
    email                                       {Faker::Internet.free_email}
    password                                     {"aaaa00"}
    password_confirmation                   {"aaaa00"}
   
   end
 end