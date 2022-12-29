FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end