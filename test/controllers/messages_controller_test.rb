require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  context "GET index" do
    should "respond ok" do
      get messages_path

      assert_response :ok
    end
  end

  context "GET new" do
    should "respond ok" do
      get new_message_path

      assert_response :ok
    end
  end

  context "POST create" do
    should "render new with invalid params" do
      invalid_params = {message: {content: ""}}

      post messages_path, params: invalid_params

      assert_template "messages/new"
    end

    should "redirect to created message with valid params" do
      valid_params = {message: {content: "A message"}}

      assert_changes -> { Message.count } do
        post messages_path, params: valid_params
      end

      assert_redirected_to message_path(Message.last)
    end
  end

  context "GET show" do
    should "respond ok" do
      message = messages(:first)

      get message_path(message)

      assert_response :ok
    end
  end
end
