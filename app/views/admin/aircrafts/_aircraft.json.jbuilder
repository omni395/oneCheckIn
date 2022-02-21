json.extract! aircraft, :id, :name, :description, :www, :iata, :icao, :checkin_link, :manage_booking, :user_id, :created_at, :updated_at
json.url aircraft_url(aircraft, format: :json)
