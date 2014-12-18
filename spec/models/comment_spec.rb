require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it {should_not be_approved}
end
