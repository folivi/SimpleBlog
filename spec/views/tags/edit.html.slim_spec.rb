require 'rails_helper'

RSpec.describe "tags/edit", :type => :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :name => "MyString",
      :label => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input#tag_name[name=?]", "tag[name]"

      assert_select "input#tag_label[name=?]", "tag[label]"

      assert_select "input#tag_description[name=?]", "tag[description]"
    end
  end
end
