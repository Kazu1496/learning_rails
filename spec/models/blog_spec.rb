require 'rails_helper'

describe Blog do
  it "titleがあれば有効な状態であること" do
    blog = Blog.new(
      title: "hogehoge"
    )
    expect(blog).to be_valid
  end
  it "titleがなければ無効な状態であること" do
    blog = Blog.new(
      title: ""
    )
    expect(blog.save).to be_falsey 
  end
end
