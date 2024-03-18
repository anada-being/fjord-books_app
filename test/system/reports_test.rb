# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit user_session_url
    @report = reports(:one)

    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'

    click_on 'ログイン'
  end

  test 'visiting the report_index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '今日の出来事'
    fill_in '内容', with: 'システムテストを書いた'
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
    assert_text '今日の出来事'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :prefer_exact

    fill_in '内容', with: '変更しているよ'
    fill_in 'タイトル', with: '更新した'
    click_on '更新'

    assert_text '日報が更新されました。'
    click_on '戻る'
    assert_text '更新した'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
