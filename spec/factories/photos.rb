FactoryBot.define do
  factory :photo do
    title                                       {"test"}
    area_id                                       {"2"}
    association :user 
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
    end
end
