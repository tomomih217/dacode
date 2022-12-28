require 'rails_helper'

describe 'ゲーム管理機能', type: :system do
  let!(:level_1){ FactoryBot.create(:level, id: 1) }
  let!(:level_2){ FactoryBot.create(:level, name: 'Level2') }
  let!(:user){ FactoryBot.create(:user) }
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
      before do
        click_on 'Level1'
      end
      it 'ゲーム開始確認画面が表示されること' do
        expect(page).to have_content('このレベルに挑戦しますか？')
      end
    end
  # level2が選択できない
    context 'Level2をクリックした時' do
      before do
        click_on 'Level2'
      end
      it 'ログイン画面に遷移すること' do
        expect(page).to have_content('Please login')
      end
    end
  # ログインすると利用できる機能
    context 'ログイン後、Level2をクリックした時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit levels_path
        click_on 'Level2'
      end
      it 'level2が選択できること' do
        expect(page).to have_content('このレベルに挑戦しますか？')
      end
    end
  end
end