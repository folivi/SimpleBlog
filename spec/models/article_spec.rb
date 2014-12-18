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
end
