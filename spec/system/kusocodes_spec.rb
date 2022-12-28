require 'rails_helper'

describe 'クソコード管理機能', type: :system do
  let!(:user_a){ FactoryBot.create(:user, username: 'user_a', email: 'user_a@example.com') }
  let(:user_b){ FactoryBot.create(:user, username: 'user_b', email: 'user_b@example.com') }
  let!(:kusocode){ FactoryBot.create(:kusocode, description: '最初のクソコード', user: user_a) }
  describe 'クソコード一覧（クソコードの墓場）' do
    before do
      visit kusocodes_path
    end
    it '投稿されたクソコードが表示されること' do
      expect(page).to have_content('最初のクソコード')
    end
  end
  describe 'クソコード投稿（クソコード破壊）' do
    # ユーザーaがログインしている時
    before do
      visit login_path
      fill_in 'メールアドレス', with: user_a.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    context 'クソコードを正常に投稿した場合' do
      before do
        visit new_kusocode_path
        fill_in 'kusocode[code]', with: kusocode.code
        fill_in 'kusocode[description]', with: '二つ目のコード'
        click_button '投稿'
      end
      it '登録完了メッセージが表示されること' do
        expect(page).to have_content 'クソコードを作成しました'
      end
    end
    context '説明文を入力しなかった場合' do
      before do
        visit new_kusocode_path
        fill_in 'kusocode[code]', with: kusocode.code
        fill_in 'kusocode[description]', with: ''
        click_button '投稿'
      end
      it '登録失敗のメッセージが表示されること' do
        expect(page).to have_content 'クソコードを作成できませんでした'
      end
      it 'エラーメッセージが表示されること' do
        expect(page).to have_content '説明を入力してください'
      end
    end
  end
  describe 'クソコード削除' do
    context 'ユーザーaがログインしている時' do
      # 自分の投稿したクソコードに削除ボタンがあること
      # 削除すると削除完了メッセージが表示されること
    end
    context 'ユーザーbがログインしている時' do
      # 他人の投稿したクソコードには削除ボタンが表示されないこと
    end
  end
end