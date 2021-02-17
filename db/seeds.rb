# User.create()

Client.destroy_all
10.times do
  Client.create(
    imie: Faker::Name.first_name,
    nazwisko: Faker::Name.last_name,
    email: Faker::Internet.email,
    numer_telefonu: Faker::PhoneNumber.cell_phone_in_e164,
    adres: Faker::Address.street_address,
    kod: Faker::Address.zip_code,
    miasto: Faker::Address.city
    user_id: User.first.id
  )
end
