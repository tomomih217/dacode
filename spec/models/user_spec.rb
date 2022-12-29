require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_b){ FactoryBot.create(:user, username: 'user_b') }
    subject { user.valid? }
    context 'usernameカラムにおいて' do
      it 'usernameは必ず存在すること' do
        user.username = ''
        is_expected.to eq false;
      end
      it 'usernameが20文字の場合、登録できること' do
        user.username = '0' * 20
        is_expected.to eq true;
      end
      it 'usernameが21文字の場合、登録できないこと' do
        user.username = '0' * 21
        is_expected.to eq false;
      end
      it '重複するusernameは登録できないこと' do
        user_b
        user.username = user_b.username
        is_expected.to eq false
      end
    end
    context 'passwordにおいて' do
      it 'passwordは2文字の場合、登録できないこと' do
        user.password = '12'
        user.password_confirmation = user.password
        is_expected.to eq false;
      end
      it 'passwordは3文字以上の場合、登録できること' do
        user.password = '123'
        user.password_confirmation = user.password
        is_expected.to eq true;
      end
      it 'password_confirmationは必ず存在すること' do
        user.password = 'password'
        user.password_confirmation = ''
        is_expected.to eq false;
      end
      it 'passwordとpassword_confirmationが異なると登録できないこと' do
        user.password = 'password'
        user.password_confirmation = 'hoge'
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションテスト' do
    context 'recordモデルとの関係' do
      it 'recordと1:Nの関係であること' do
        should have_many(:records)
      end
    end
    context 'kusocodeモデルとの関係' do
      it 'kusocodeと1:Nの関係であること' do
        should have_many(:kusocodes)
      end
    end
    context 'flowerモデルとの関係' do
      it 'flowerと1:Nの関係であること' do
        should have_many(:flowers)
      end
      it 'flowerとkusocodeとの関係がN:1:Nであること' do
        should have_many(:flowered_kusocodes)
      end
    end
  end
end
