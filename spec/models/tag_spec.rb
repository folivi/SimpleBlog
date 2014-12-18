require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it 'should not be valid without a name' do
    tag = Tag.new
    tag.should_not be_valid
  end
end
