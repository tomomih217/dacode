FactoryBot.define do
  factory :kusocode do
    code { 'def code \r\n test\r\n end' }
    description { 'This is test.' }
    user
  end
end