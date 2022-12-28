require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'バリデーションテスト' do
    let(:user){ FactoryBot.create(:user) }
    let(:level){ FactoryBot.create(:level) }
    let(:record){ FactoryBot.create(:record) }
    it 'userとlevelの組み合わせが同じものを登録できない' do
      another_record = FactoryBot.build(:record, user_id: record.user_id, level_id: record.level_id)
      expect(another_record.valid?).to eq false
    end
    it 'statusがenum設定されている' do
      is_expected.to define_enum_for(:status).with_values(challenge: 0, giveup: 1, cleared: 2)
    end
  end
end
