require "application_system_test_case"

class EventResponsesTest < ApplicationSystemTestCase
  setup do
    @event_response = event_responses(:one)
  end

  test "visiting the index" do
    visit event_responses_url
    assert_selector "h1", text: "Event Responses"
  end

  test "creating a Event response" do
    visit event_responses_url
    click_on "New Event Response"

    click_on "Create Event response"

    assert_text "Event response was successfully created"
    click_on "Back"
  end

  test "updating a Event response" do
    visit event_responses_url
    click_on "Edit", match: :first

    click_on "Update Event response"

    assert_text "Event response was successfully updated"
    click_on "Back"
  end

  test "destroying a Event response" do
    visit event_responses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event response was successfully destroyed"
  end
end
