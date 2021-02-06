json.extract! client, :id, :imie, :nazwisko, :numer_telefonu, :email, :miasto, :kod, :adres, :created_at, :updated_at
json.url client_url(client, format: :json)
