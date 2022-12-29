require 'rails_helper'

describe 'ユーザー管理機能' do
  describe 'ユーザー新規作成機能' do
    let(:user_a){ FactoryBot.create(:user, username: 'user_a') }
    context '全ての項目に入力したら' do
      before do
        visit new_user_path
        fill_in 'ユーザー名', with: 'user'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録する'
      end
      it 'ユーザー新規作成できるか' do
        expect(page).to have_content 'ユーザーを作成しました'
      end
    end
    context 'ユーザー名を空欄にすると' do
      before do
        visit new_user_path
        fill_in 'ユーザー名', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録する'
      end
      it 'ユーザー作成に失敗するか' do
        expect(page).to have_content 'ユーザーを作成できませんでした'
      end
    end
    context 'パスワードを空欄にすると' do
      before do
        visit new_user_path
        fill_in 'ユーザー名', with: 'user'
        fill_in 'パスワード', with: ''
        fill_in 'パスワード確認', with: 'password'
        click_button '登録する'
      end
      it 'ユーザー作成に失敗するか' do
        expect(page).to have_content 'ユーザーを作成できませんでした'
      end
    end
  end
  describe 'ログイン機能' do
    let!(:user_a){ FactoryBot.create(:user, username: 'user_a') }
    context '登録済のユーザーがログインを試みると' do
      before do
        visit login_path
        fill_in 'ユーザー名', with: user_a.username
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end
      it 'ログインできるか' do
        expect(page).to have_content "#{user_a.username}の成績"
      end
    end
    context 'ユーザー名に空欄があると' do
      before do
        visit login_path
        fill_in 'ユーザー名', with: ''
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
      end
      it 'ログイン失敗するか' do
        expect(page).to have_content 'ログインできませんでした'
      end
    end
    context 'パスワードに空欄があると' do
      before do
        visit login_path
        fill_in 'ユーザー名', with: user_a.username
        fill_in 'パスワード', with: ''
        click_button 'ログイン'
      end
      it 'ログイン失敗するか' do
        expect(page).to have_content 'ログインできませんでした'
      end
    end
  end
  describe 'ログアウト機能' do
    let!(:user_a){ FactoryBot.create(:user, username: 'user_a') }
    context 'user_aでログインしている時' do
      before do
        visit login_path
        fill_in 'ユーザー名', with: user_a.username
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        find_by_id('mypage-icon').click
        click_on 'ログアウト'
      end
      it 'ログアウトできること' do
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
end