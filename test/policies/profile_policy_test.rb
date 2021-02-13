require "test_helper"

class ProfilePolicyTest < ActiveSupport::TestCase
  context "new?" do
    should "be authorised" do
      policy = ProfilePolicy.new(nil, nil)
      assert policy.new?
    end
  end

  context "create?" do
    should "be authorised" do
      policy = ProfilePolicy.new(nil, nil)
      assert policy.create?
    end
  end
end
