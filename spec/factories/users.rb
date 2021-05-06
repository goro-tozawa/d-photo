FactoryBot.define do
  factory :user do
    name                                       {"あああああ"}
    nickname                                       {"test"}
    email                                       {Faker::Internet.free_email}
    password                                     {"aaaa00"}
    password_confirmation                   {"aaaa00"}
    # after(:build) do |message|
    # message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    # end
   end
 end