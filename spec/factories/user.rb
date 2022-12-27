FactoryBot.define do
  factory :user do
    username { 'テストユーザー' }
    email { 'test@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end