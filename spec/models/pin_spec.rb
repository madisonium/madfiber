require 'spec_helper'

describe Pin do
  before(:each) do
    @valid_attributes = {
      :name => "MyString",
      :address => "MyString",
      :zip => "MyString",
      :approved => false
    }
  end

  it "should create a new instance given valid attributes" do
    Pin.create!(@valid_attributes)
  end
end
