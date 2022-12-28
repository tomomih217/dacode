require 'rails_helper'

describe '献花（いいね）機能', type: :system do
  let!(:user_a){ FactoryBot.create(:user, username: 'user_a', email: 'user_a@example.com') }
  let!(:user_b){ FactoryBot.create(:user, username: 'user_b', email: 'user_b@example.com') }
  let!(:kusocode){ FactoryBot.create(:kusocode, user: user_a, id: 1) }
  let(:flower){ FactoryBot.create(:flower, user: user_b, kusocode: kusocode) }
  context 'ユーザーBでログインした時' do
    before do
        visit login_path
        fill_in 'メールアドレス', with: user_b.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
    end
    # 他人のクソコードに献花（いいね）ができること
    context '他人のクソコードの花アイコンをクリックすると' do
      before do
        visit kusocodes_path
        click_on 'white-flower-for-kusocode-1'
      end
      it '献花（いいね）ができること' do
        expect(page).to have_selector 'img[alt="black-flower-for-kusocode-1"]'
      end
    end
    # 献花（いいね）を取り消すことができること
    context '献花済の花アイコンをもう一度クリックすると' do
      before do
        flower
        visit kusocodes_path
        click_on 'black-flower-for-kusocode-1'
      end
      it '献花（いいね）を取り消せること' do
        expect(page).to have_selector 'img[alt="white-flower-for-kusocode-1"]'
      end
    end
  end
  # 自分のクソコードには献花ができないこと
  context 'ユーザーAでログインした時' do
    before do
      visit login_path
      fill_in 'メールアドレス', with: user_a.email
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end
    context '自分のクソコードの花アイコンをクリックすると' do
      before do
        visit kusocodes_path
      end
      it '献花（いいね）できないこと' do
        expect(page).to have_no_link 'white-flower-for-kusocode-1'
      end
    end
  end
end