require "test_helper"

class MessagePolicyTest < ActiveSupport::TestCase
  context "new?" do
    should "be authorised" do
      policy = MessagePolicy.new(nil, nil)
      assert policy.new?
    end
  end

  context "create?" do
    should "be authorised" do
      policy = MessagePolicy.new(nil, nil)
      assert policy.create?
    end
  end

  context "edit?" do
    should "be authorised for message owner" do
      message = messages(:first)
      policy = MessagePolicy.new(message.entry.account, message)
      assert policy.edit?
    end

    should "not be authorised" do
      message = messages(:first)
      policy = MessagePolicy.new(nil, message)
      refute policy.edit?
    end
  end

  context "update?" do
    should "be authorised for message owner" do
      message = messages(:first)
      policy = MessagePolicy.new(message.entry.account, message)
      assert policy.update?
    end

    should "not be authorised" do
      message = messages(:first)
      policy = MessagePolicy.new(nil, message)
      refute policy.update?
    end
  end
end
