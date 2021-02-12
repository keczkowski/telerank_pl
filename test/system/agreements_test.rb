require "application_system_test_case"

class AgreementsTest < ApplicationSystemTestCase
  setup do
    @agreement = agreements(:one)
  end

  test "visiting the index" do
    visit agreements_url
    assert_selector "h1", text: "Agreements"
  end

  test "creating a Agreement" do
    visit agreements_url
    click_on "New Agreement"

    fill_in "Body", with: @agreement.body
    fill_in "Client", with: @agreement.client_id
    fill_in "Name", with: @agreement.name
    fill_in "Partner", with: @agreement.partner_id
    fill_in "Screenplay", with: @agreement.screenplay_id
    fill_in "User", with: @agreement.user_id
    click_on "Create Agreement"

    assert_text "Agreement was successfully created"
    click_on "Back"
  end

  test "updating a Agreement" do
    visit agreements_url
    click_on "Edit", match: :first

    fill_in "Body", with: @agreement.body
    fill_in "Client", with: @agreement.client_id
    fill_in "Name", with: @agreement.name
    fill_in "Partner", with: @agreement.partner_id
    fill_in "Screenplay", with: @agreement.screenplay_id
    fill_in "User", with: @agreement.user_id
    click_on "Update Agreement"

    assert_text "Agreement was successfully updated"
    click_on "Back"
  end

  test "destroying a Agreement" do
    visit agreements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agreement was successfully destroyed"
  end
end
