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

  context "update?" do
    should "be authorised if entryable policy authorises" do
      entry = entries(:first)
      policy = EntryPolicy.new(entry.account, entry)
      mock_entryable_policy entry, action: :update?, authorise: true do
        assert policy.update?
      end
    end

    should "not be authorised if entryable policy does not authorise" do
      entry = entries(:first)
      policy = EntryPolicy.new(entry.account, entry)
      mock_entryable_policy entry, action: :update?, authorise: false do
        refute policy.update?
      end
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

  def mock_entryable_policy(entry, action:, authorise:, &block)
    policy_mock = Minitest::Mock.new
    policy_mock.expect action, authorise
    Pundit.stub :policy, ->(_, record) { policy_mock if record == entry.entryable } do
      yield
    end
  end
end
