require 'rails_helper'

describe 'ゲーム管理機能', type: :system do
  let!(:level_1){ FactoryBot.create(:level) }
  let!(:level_2){ FactoryBot.create(:level, name: 'Level2') }
  describe 'ゲーム一覧画面について' do 
    before do
      visit levels_path
    end
  # ログインしないで利用できる機能
    context 'クリアした人が0人の時' do
      it '正答率が0%になること' do
        expect(page).to have_content('0%')
      end
    end
  # level1を選択するとゲーム開始確認画面が表示される
    context 'Level1をクリックした時' do
      it 'ゲーム開始確認画面が表示されること' do
        expect(page).to have_content('Level1')
      end
    end
  # level2が選択できない
    context 'Level2をクリックした時' do
      it 'ログイン画面に遷移すること' do
        expect(page).to have_content('ログイン')
      end
    end
  # ログインすると利用できる機能
    # level2が選択できる
  end
end