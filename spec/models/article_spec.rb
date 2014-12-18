require 'rails_helper'

RSpec.describe Article, :type => :model do
  it {should respond_to(:comments)}
  it {should respond_to(:tags)}
  it {should respond_to(:user)}
  it {should respond_to(:title)}
  it {should_not be_valid}
  it {should be_draft}
  
  it'should not be valid without a title' do
    article = Article.new
    article.should_not be_valid
  end

  it 'comments count should increase when a new comment is added' do
    article = Article.new(title: "Who shot ya?", content: "It wasn't me!")
    count = article.comments.size
    count.should eq(0)
    comm = Comment.new(content: "Are you sure??")
    article.comments << comm
    article.comments.size.should eq(count + 1)

  end
end
