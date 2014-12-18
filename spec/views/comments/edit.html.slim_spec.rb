require 'rails_helper'

RSpec.describe "comments/edit", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :content => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_content[name=?]", "comment[content]"
    end
  end
end
