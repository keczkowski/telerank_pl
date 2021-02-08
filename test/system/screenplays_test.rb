require "application_system_test_case"

class ScreenplaysTest < ApplicationSystemTestCase
  setup do
    @screenplay = screenplays(:one)
  end

  test "visiting the index" do
    visit screenplays_url
    assert_selector "h1", text: "Screenplays"
  end

  test "creating a Screenplay" do
    visit screenplays_url
    click_on "New Screenplay"

    fill_in "Body", with: @screenplay.body
    fill_in "Name", with: @screenplay.name
    click_on "Create Screenplay"

    assert_text "Screenplay was successfully created"
    click_on "Back"
  end

  test "updating a Screenplay" do
    visit screenplays_url
    click_on "Edit", match: :first

    fill_in "Body", with: @screenplay.body
    fill_in "Name", with: @screenplay.name
    click_on "Update Screenplay"

    assert_text "Screenplay was successfully updated"
    click_on "Back"
  end

  test "destroying a Screenplay" do
    visit screenplays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Screenplay was successfully destroyed"
  end
end
