require 'rails_helper'

RSpec.describe Kusocode, type: :model do
  describe 'バリデーションテスト' do
    let(:user){ FactoryBot.create(:user) }
    let(:kusocode){ FactoryBot.create(:kusocode) }
    context 'codeカラムにおいて' do
      # codeが空欄ではないこと
      # codeが65535文字の場合、登録できること
      # codeが65536文字の場合、登録できないこと
    end
    context 'descriptionカラムにおいて' do
      # descriptionが空欄でないこと
      # descriptionが255文字の場合、登録できること
      # descriptionが256文字の場合、登録できないこと
    end
  end
  describe 'アソシエーションテスト' do
    context 'flowerモデルとの関係' do
      # flowerとの関係が1:Nであること
    end
  end
end
