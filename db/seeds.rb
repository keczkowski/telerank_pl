User.destroy_all
Partner.destroy_all
Screenplay.destroy_all
Question.destroy_all
Client.destroy_all
Call.destroy_all

user = User.create(
  name: 'Michał Trziszka',
  position: 'Administrator',
  email: 'admin@telerank.pl',
  password: '123qwe!@#QWE',
  password_confirmation: '123qwe!@#QWE',
  manage_agreements: true,
  manage_calls: true,
  manage_clients: true,
  manage_events: true,
  manage_partners: true,
  manage_reminders: true,
  manage_screenplays: true,
  manage_users: true
)

5.times do
  partner = Partner.create(
    name: Faker::Company.name
  )
  3.times do
    screenplay = Screenplay.create(
      partner_id: partner.id,
      name: Faker::App.name,
      body: Faker::Lorem.paragraph(sentence_count: 30)
    )
    5.times do
      n = 1
      question = Question.create(
        screenplay_id: screenplay.id,
        name: Faker::Lorem.sentence,
        body: Faker::Lorem.question,
        sequence: n += 1
      )
    end
  end
end

100.times do
  client = Client.create(
    user_id: user.id,
    imie: Faker::Name.first_name,
    nazwisko: Faker::Name.last_name,
    numer_telefonu: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    miasto: Faker::Address.city,
    kod: Faker::Address.zip_code,
    adres: Faker::Address.street_address
  )
  3.times do
    call = Call.create(
      client_id: client.id,
      user_id: user.id,
      screenplay_id: Screenplay.all.sample.id,
      status: 'Rozmowa zakonczona sukcesem'
    )
  end
end
