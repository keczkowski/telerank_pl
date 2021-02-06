require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Adres", with: @client.adres
    fill_in "Email", with: @client.email
    fill_in "Imie", with: @client.imie
    fill_in "Kod", with: @client.kod
    fill_in "Miasto", with: @client.miasto
    fill_in "Nazwisko", with: @client.nazwisko
    fill_in "Numer telefonu", with: @client.numer_telefonu
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "updating a Client" do
    visit clients_url
    click_on "Edit", match: :first

    fill_in "Adres", with: @client.adres
    fill_in "Email", with: @client.email
    fill_in "Imie", with: @client.imie
    fill_in "Kod", with: @client.kod
    fill_in "Miasto", with: @client.miasto
    fill_in "Nazwisko", with: @client.nazwisko
    fill_in "Numer telefonu", with: @client.numer_telefonu
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "destroying a Client" do
    visit clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client was successfully destroyed"
  end
end
