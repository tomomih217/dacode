require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    let(:user) { FactoryBot.create(:user) }
    subject { user.valid? }
    context 'usernameカラムにおいて' do
      it 'usernameは必ず存在すること' do
        user.username = ''
        is_expected.to eq false;
      end
      it 'usernameが20文字の場合、登録できること' do
        user.username = '01234567890123456789'
        is_expected.to eq true;
      end
      it 'usernameが21文字の場合、登録できないこと' do
        user.username = '012345678901234567890'
        is_expected.to eq false;
      end
    end
    context 'emailカラムにおいて' do
      it 'emailは必ず存在すること' do
        user.email = ''
        is_expected.to eq false;
      end
      it 'emailは一意であること(同じemailは許容しない)' do
        another_user = FactoryBot.build(:user, email: user.email)
        expect(another_user.valid?).to eq false;
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
        expect(User.reflect_on_association(:records).macro).to eq :has_many
      end
    end
    context 'kusocodeモデルとの関係' do
      it 'kusocodeと1:Nの関係であること' do
        expect(User.reflect_on_association(:kusocodes).macro).to eq :has_many
      end
    end
    context 'flowerモデルとの関係' do
      it 'flowerと1:Nの関係であること' do
        expect(User.reflect_on_association(:flowers).macro).to eq :has_many
      end
      it 'flowerとkusocodeとの関係がN:1:Nであること' do
        expect(User.reflect_on_association(:flowered_kusocodes).macro).to eq :has_many
      end
    end
  end
end
