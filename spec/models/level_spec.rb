require 'rails_helper'

RSpec.describe Level, type: :model do
  describe 'バリデーションテスト' do
    let(:level) { FactoryBot.create(:level) }
    subject { level.valid? }
    it 'nameが存在すること' do
      level.name = ''
      is_expected.to eq false
    end
    it 'level_imageが存在すること' do
      level.level_image = ''
      is_expected.to eq false
    end
  end
  describe 'アソシエーションテスト' do
    it 'recordとの関係が1:Nであること' do
      expect(Level.reflect_on_association(:records).macro).to eq :has_many
    end
  end
end
