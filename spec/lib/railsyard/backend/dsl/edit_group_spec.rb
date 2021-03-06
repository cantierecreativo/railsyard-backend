require 'spec_helper'

describe Railsyard::Backend::Dsl::EditGroup do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::EditGroup.new(config) }

  describe ".field" do
    it "initialize a Config::EditField and adds it to config" do
      field_config = stub
      Railsyard::Backend::Config::EditField.stubs(:new).with(:foo).returns(field_config)
      config.expects(:add_field).with(field_config)
      subject.field(:foo)
    end
  end

  describe ".nested" do
    it "initialize a Config::NestedEdit and adds it to config" do
      field_config = stub
      Railsyard::Backend::Config::NestedEdit.stubs(:new).with(:foo).returns(field_config)
      config.expects(:add_nested).with(field_config)
      subject.nested(:foo)
    end
  end

end
