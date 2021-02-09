require "test_helper"

class EntryPolicyTest < ActiveSupport::TestCase
  context "scope" do
    should "be all" do
      scope = EntryPolicy::Scope.new(nil, Entry.all)
      assert_equal scope.resolve, Entry.all
    end
  end

  context "show?" do
    should "be authorised" do
      policy = EntryPolicy.new(nil, nil)
      assert policy.show?
    end
  end

  context "destroy?" do
    should "be authorised for entry owner" do
      entry = entries(:first)
      policy = EntryPolicy.new(entry.account, entry)
      assert policy.destroy?
    end

    should "not be authorised" do
      entry = entries(:first)
      policy = EntryPolicy.new(nil, entry)
      refute policy.destroy?
    end
  end
end
