require 'test_helper'

class EventResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_response = event_responses(:one)
  end

  test "should get index" do
    get event_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_event_response_url
    assert_response :success
  end

  test "should create event_response" do
    assert_difference('EventResponse.count') do
      post event_responses_url, params: { event_response: {  } }
    end

    assert_redirected_to event_response_url(EventResponse.last)
  end

  test "should show event_response" do
    get event_response_url(@event_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_response_url(@event_response)
    assert_response :success
  end

  test "should update event_response" do
    patch event_response_url(@event_response), params: { event_response: {  } }
    assert_redirected_to event_response_url(@event_response)
  end

  test "should destroy event_response" do
    assert_difference('EventResponse.count', -1) do
      delete event_response_url(@event_response)
    end

    assert_redirected_to event_responses_url
  end
end
