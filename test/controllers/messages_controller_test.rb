require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  context "GET index" do
    should "require authentication" do
      get messages_path

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get messages_path

      assert_response :ok
    end
  end

  context "GET new" do
    should "require authentication" do
      get new_message_path

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get new_message_path

      assert_response :ok
    end
  end

  context "POST create" do
    should "require authentication" do
      post messages_path

      assert_requires_authentication
    end

    should "render new with invalid params" do
      invalid_params = {message: {content: ""}}
      log_in_as accounts(:john)

      post messages_path, params: invalid_params

      assert_template "messages/new"
    end

    should "redirect to created message with valid params" do
      valid_params = {message: {content: "A message"}}
      log_in_as accounts(:john)

      assert_changes -> { Message.count } do
        post messages_path, params: valid_params
      end

      assert_redirected_to message_path(Message.last)
    end
  end

  context "GET show" do
    should "require authentication" do
      get message_path(messages(:first))

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get message_path(messages(:first))

      assert_response :ok
    end
  end

  context "GET edit" do
    should "require authentication" do
      get edit_message_path(messages(:first))

      assert_requires_authentication
    end

    should "respond ok" do
      log_in_as accounts(:john)

      get edit_message_path(messages(:first))

      assert_response :ok
    end
  end

  context "PATCH update" do
    should "require authentication" do
      patch message_path(messages(:first))

      assert_requires_authentication
    end

    should "render edit with invalid params" do
      invalid_params = {message: {content: ""}}
      log_in_as accounts(:john)

      patch message_path(messages(:first)), params: invalid_params

      assert_template "messages/edit"
    end

    should "redirect to updated message with valid params" do
      message = messages(:first)
      valid_params = {message: {content: "Updated message"}}
      log_in_as accounts(:john)

      assert_changes -> { message.reload.content.to_plain_text } do
        patch message_path(message), params: valid_params
      end

      assert_redirected_to message_path(message)
    end
  end

  context "DELETE destroy" do
    should "require authentication" do
      delete message_path(messages(:first))

      assert_requires_authentication
    end

    should "redirect to index" do
      log_in_as accounts(:john)

      assert_changes -> { Message.count } do
        delete message_path(messages(:first))
      end

      assert_redirected_to messages_path
    end
  end
end
