require 'rails_helper'

describe Entry do
  it '必須項目であるtitle,bodyがともに入力されてあること' do
    entry = Entry.new(
      title: "hogehoge",
      body: "fugafuga"
    )
    expect(entry).to be_valid
  end
  it '必須項目であるtitleがなければ無効であること' do
    entry = Entry.new(
      title: "",
      body: "hogehoge"
    )
    expect(entry.save).to be_falsey
  end
  it '必須項目であるbodyがなければ無効であること' do
    entry = Entry.new(
      title: "hogehoge",
      body: ""
    )
    expect(entry.save).to be_falsey
  end
  it '必須項目であるtitle,bodyがなければ無効であること' do
    entry = Entry.new(
      title: "",
      body: ""
    )
    expect(entry.save).to be_falsey
  end
end
