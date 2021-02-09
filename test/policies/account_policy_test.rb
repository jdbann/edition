require "test_helper"

class AccountPolicyTest < ActiveSupport::TestCase
  context "new?" do
    should "be authorised" do
      policy = AccountPolicy.new(nil, nil)
      assert policy.new?
    end
  end

  context "create?" do
    should "be authorised" do
      policy = AccountPolicy.new(nil, nil)
      assert policy.create?
    end
  end
end
