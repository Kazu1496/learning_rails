require 'rails_helper'

feature 'Blog管理' do
  background do
    @blog = Blog.create(title: 'hogehoge')
  end

  scenario 'Blogが投稿できること' do
    visit root_path
    click_link 'New Blog'
    fill_in 'title', with: 'hogehoge'

    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq root_path
    expect(page).to have_content 'ブログを作成しました。'
  end
end
